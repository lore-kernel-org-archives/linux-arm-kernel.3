Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BDFD1036E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 23:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wg4HmrNVHeBtWijsLzpE86w4oWmAVERt6Q8LoMVDiSM=; b=N46DhO7VVRIeG1Km+sEa5K3NQs
	uAZQj1AZ1UumBSrCkuLTmHMkpVYOhFyZsDGxUatsgx10q2hm/CuLmQnFgqPIw7gF8vyiPC2MOUBx4
	oUzDSW4qQ9Tydkv5diHxmp/0rT4TfBE/PH6bBdo9vWjokERsQc/e3UnRBxMu6ikLtggFiNEnPOfxc
	1JtTCe3S5eHZJs4lvQCIbKVN0Jo23eyX0dJ9oui/H4TPN/3E5eEXo0fsarJoct6gbh4qBHL89d6GB
	7ujDr0peHDlFfzlDcyEoCoHU5dNzasJo7GCfUFcUIz84ISnC+TYXX/al0yAQdMWeCBuughlAuZ07k
	EDFGtBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2gk-0000000E5B4-0Cz2;
	Tue, 25 Nov 2025 23:43:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2gf-0000000E5AW-2gvA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 23:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764114187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wg4HmrNVHeBtWijsLzpE86w4oWmAVERt6Q8LoMVDiSM=;
	b=MbOiwZEaCNbLYcSccNZHqDoGtLe1VqS9v9mmo7hTJxDjcBEvmjWeq+P5dsvHdGOBuB5isk
	/808zG7TlG7Nlnz3Kxr7iM+EsvWJ7fl97LXuGmSO6yegc3TcZrkWDTyup4SjghMIl8mMHj
	vNlO/Hq0fXKXTYVK6EnAGbQmDNFGYYo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-FUgxkG0lOFWkyIy5uVWW_Q-1; Tue,
 25 Nov 2025 18:43:04 -0500
X-MC-Unique: FUgxkG0lOFWkyIy5uVWW_Q-1
X-Mimecast-MFC-AGG-ID: FUgxkG0lOFWkyIy5uVWW_Q_1764114184
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 707C31800650;
	Tue, 25 Nov 2025 23:43:03 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B11C818004A3;
	Tue, 25 Nov 2025 23:43:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci (6.18.0-rc7,
 upstream-arm-next, b5fb0949)
Date: Tue, 25 Nov 2025 23:43:01 -0000
To: catalin.marinas@arm.com, will@kernel.org, yoyang@redhat.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <15220.125112518430500117@us-mta-125.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zAPAm8i2rw3pqrdnbgs_DfOYPWVp5dj5acDZTv-8HuI_1764114184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_154309_747911_20067F2A 
X-CRM114-Status: UNSURE (   7.66  )
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
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2179290550

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179290550_aarch64_kernel_kcidb_tool_20091234_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL btrfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179290550_aarch64_kernel_kcidb_tool_20091756_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL btrfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - ext4
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179290550_aarch64_kernel_kcidb_tool_20091234_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL ext4:install_xfstests
                       =E2=9D=8C FAIL exit_code
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179290550_aarch64_kernel_kcidb_tool_20091756_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL ext4:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - xfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179290550_aarch64_kernel_kcidb_tool_20091234_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL xfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179290550_aarch64_kernel_kcidb_tool_20091756_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL xfs:install_xfstests
                       =E2=9D=8C FAIL exit_code

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]



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


