Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73699C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 19:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nBxx/eE2e9gfrwmO3yu3EADPs8hhLPS0IhAa6Hmjx6o=; b=a7I0JiQf3/PUTIi0iqu7BAhHRV
	2VQpCrFbcigoUQUmnuShA1qYdwJ5VjTqNt9YbNilPKcxFwyV/C2hZ1hGsP7xua7jNli5KQUs1kyss
	HI3/jxdHJKaVa/iOzYg5o/kfajF1I6E21tvTxI9K6IQFyzo8MKUdH+hduKTyBYeLzZPOwURUepuM1
	+QKlFrFwcO8vWLlvTkagwshOl6G+uvyzL8w8F0hjTJgL8ucf9tEFSdJdAi6poZ5j5Npd1k2s/lQET
	fpz8ghMhdI5cjCQKSNUO19kBOifeB73I1DuDIx7N7tHOlNXaoVG0ECIZWhrJ1mzeT/Z1VsgXbOKCE
	vMZM301A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrwI-00000001EF1-1YAX;
	Fri, 17 Jan 2025 19:23:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrv2-00000001E96-00lO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 19:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737141729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nBxx/eE2e9gfrwmO3yu3EADPs8hhLPS0IhAa6Hmjx6o=;
	b=TFIDQTHFbPMdweRz30+aCNi7n7nZMEGk3PJ+GfO7g0ioYM3ABop8HTNmB3KVgj9QqfM+/i
	YsRu3ZZaDTy1P91GNToJknenIyq0u/BqSR8PShuIXmuv/NwKBv9PHY1enTPmYCCIx7+8E2
	kNE2ri2z8mUaDhRWHrWKU1XeL1EkxMk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-568-83ybM9gTPsSHlND6Q3y3Bg-1; Fri,
 17 Jan 2025 14:22:06 -0500
X-MC-Unique: 83ybM9gTPsSHlND6Q3y3Bg-1
X-Mimecast-MFC-AGG-ID: 83ybM9gTPsSHlND6Q3y3Bg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 66B381955DA0;
	Fri, 17 Jan 2025 19:22:05 +0000 (UTC)
Received: from [172.64.12.20] (unknown [10.30.33.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB0C630001BE;
	Fri, 17 Jan 2025 19:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.13.0-rc7,
 upstream-arm-next, 1950a0af)
Date: Fri, 17 Jan 2025 19:22:04 -0000
To: catalin.marinas@arm.com, yoyang@redhat.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <45567.125011714220601212@us-mta-568.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LO8sA0OZ27oB7s6s7AhXY5Qc-dLd7jNzBlXwdnVnoEo_1737141725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_112212_110196_8F30AD44 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'arm64-upstream' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1629927092

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1629927092-aarch64-kernel_upt_56
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL btrfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1629927092-aarch64-kernel_upt_64
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL btrfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - ext4
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1629927092-aarch64-kernel_upt_54
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL ext4:install_xfstests
                       =E2=9D=8C FAIL exit_code
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1629927092-aarch64-kernel_upt_62
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL ext4:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - xfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1629927092-aarch64-kernel_upt_55
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL xfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1629927092-aarch64-kernel_upt_63
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL xfs:install_xfstests
                       =E2=9D=8C FAIL exit_code

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kdump - kexec-file-load: Kexec boot failed as fileloadoption=
 is not seen in kernel boot options
            URL: https://issues.redhat.com/browse/RHELTEST-44
            Affected tests:
                kdump - kexec-file-load [aarch64]



If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


