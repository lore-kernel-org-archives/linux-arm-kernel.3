Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEEEC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 22:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PyIGhc+TI6uAsMli3blpmdtMgIgcHPiIWgrHiXvVj38=; b=jsDGlYyjlxGG4r1qR6mzLXH7JX
	RrsOlmrxj4NnOvkSFaqTlcF6fO16YG/NIV+tq7M4Lco6SNWd+Vo6Z1NsgqrUI7na7D2yYoz768o7g
	ismx/7g6kLiYcjDKwAzmtT4tl5ATH2ep6IgqCBfjJ+hljnhzVx7OrgaiJeSjiMPObKyrCZRlNw/jK
	fdq8NOX68dmretpwgiMMbSopK+l2iLT0gX+2CU5oQtQqA4J9ixJO0dAbQ89xusY1y8c7fl2k1R87g
	xSO2xqFdyZpcHpGZ/GIpzidRP/uxR2gHsWlY4ofd5qaaIZM/HfFVRco3ddhFkILfDYXK0AgnuaXzr
	xq2FgYwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sJT-0000000CKNE-3qAt;
	Thu, 24 Sep 2026 22:53:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9sJQ-0000000CKMK-4B4R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 22:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790290387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PyIGhc+TI6uAsMli3blpmdtMgIgcHPiIWgrHiXvVj38=;
	b=O6OqRVWkrA+O0yC99U/v/4xwJBdSPKs1vaBWBN6dRl426PDOaJS+piIr+N39eaSPwCeV8m
	XPJdYPgUmAU3tdPKNkN6Y1zpTGl7TE6M6pt+TCki6unARw5SOHY3Z2W7mEwi3LJ79/tUyx
	vd7ByRvzOGnpcLcmtDjsiHAwgYjx9Vc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-ZVssw3Y3NOGfsTxO5Vk8fw-1; Thu,
 24 Sep 2026 18:53:06 -0400
X-MC-Unique: ZVssw3Y3NOGfsTxO5Vk8fw-1
X-Mimecast-MFC-AGG-ID: ZVssw3Y3NOGfsTxO5Vk8fw_1790290385
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 075E118A6952;
	Thu, 24 Sep 2026 22:53:05 +0000 (UTC)
Received: from [172.20.117.44] (unknown [10.30.44.223])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6E41619560AB;
	Thu, 24 Sep 2026 22:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.3.0-rc4,
 upstream-arm-next, 06f4daa3)
Date: Thu, 24 Sep 2026 22:53:04 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <96824.126092418530600193@us-mta-266.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tVIZnIrJkshhXYrpvfygYeOSrOM1YgdMUOszdK1x-l8_1790290385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_155309_135780_A9BF3709 
X-CRM114-Status: UNSURE (   7.48  )
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

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge branch 'for-next/core' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2879694559

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]
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


