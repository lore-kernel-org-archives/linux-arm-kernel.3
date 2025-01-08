Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271B5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 23:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nVvhATWey38ynPb1qbDky8MyF1nm4tzMBJPZvCvPTYQ=; b=f9wa4xofjs7WJBRJFlyM+KwJJI
	flKQfgN4iUAhPs46DBwPQvcZP6YxV6lAknZToHJd94fH5HCMqYatJMEzFxOTVMOjINbxEmYxQ9by+
	qDVYtER+ZYftombUrvtGDYsRrvMuAwYRX6rkgwaAQbFCp1XHV7pLxfvzxuUAcm/SiH26v3J2X67N2
	TxBzpoVdu2koGr1sV+iwgwjDkB4MxqZs2NHVoOLjQqQbqKbdLk49AL/Gstq3rvu3akbRPgEPmCc0P
	cGRWyMmMQGVxwzZSLNKR6CQFMUEwawheJy3lIGAdTYDtsOdkPTnOyaVID4ZtrPmzjyyP2pYlTLLmt
	gpD251xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfkm-0000000ABRI-1VZi;
	Wed, 08 Jan 2025 23:46:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVfiH-0000000AB7r-29Ub
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 23:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736379787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nVvhATWey38ynPb1qbDky8MyF1nm4tzMBJPZvCvPTYQ=;
	b=EeU5XYTac08hOPz5FT6ir9AgY+x/IzbvUV4JEerp1tXh0YXVckSaBAdyk+RzwTVxGyrm64
	1N6cnGoHjgpW85VHAzwL1gEUPhetgiaRvCX4ZnYA0UTeaVNERX+re8gCmUc1QpRk6aFStk
	XSiOqqCtTZLvJcLU80I0ueziSifDzQk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-121-R1SE5xg_MqS0rNmWcbb7ng-1; Wed,
 08 Jan 2025 18:43:05 -0500
X-MC-Unique: R1SE5xg_MqS0rNmWcbb7ng-1
X-Mimecast-MFC-AGG-ID: R1SE5xg_MqS0rNmWcbb7ng
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CCC16195608A;
	Wed,  8 Jan 2025 23:43:04 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E9D4A19560AB;
	Wed,  8 Jan 2025 23:43:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.13.0-rc6,
 upstream-arm-next, 577490b6)
Date: Wed, 08 Jan 2025 23:43:03 -0000
To: will@kernel.org, bgoncalv@redhat.com, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <88638.125010818430600129@us-mta-121.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QYFw1Gqd8C_wwhCF-4qIzAstnVUrjNp96K38d8pACYw_1736379785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_154349_622888_C07F97D2 
X-CRM114-Status: UNSURE (   7.20  )
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
    Commit message: Merge branches 'for-next/core' and 'for-next/perf' into=
 for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1616589950

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_14
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_37
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_50
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_57
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_65
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_20
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_46
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_53
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_61
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1616589950-aarch64-kernel_upt_69
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]



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


