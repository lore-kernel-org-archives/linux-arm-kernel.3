Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F62DCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 22:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QE2ZBuvBtsyonJtw6gxDXflUgxP6mbU9Qz4jXJSFPXU=; b=HXRq1XBBDnen1OZzVmMF8QU4ei
	GHle4kGGhW9HIoZ7N/DS695+Y51Wufs1QLSJSkWfaP6hDWBoV6ihw4ZJEwec9wtexm+VMxVvZDtSg
	ISq8NA4dZPvwR6AdhZgc5N4XEe2g5USB2DKB5W0DstrYISmVvPVWcsBID2c20468Epwha2r53agqE
	BCtrP0U/G5jdvB2JcGVRHiomeXYGlVTyXzJLXpv2WWS5dUyD7HwbAoZHqOUDE5KyR7/KLCL9xHtu9
	TLgot/aANn7Uae0JVYknxyIjaJ+bvc4K7/TSyKJI82f5tIj6O5nxZ1YIKtVcZJESp2CvZPnoT7aJg
	inF6EE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Xjh-00000004BX1-0pyE;
	Wed, 24 Sep 2025 22:13:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Xjd-00000004BU9-343R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 22:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758751991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QE2ZBuvBtsyonJtw6gxDXflUgxP6mbU9Qz4jXJSFPXU=;
	b=XP/G0swGmokDiRnBvFJ4+0JnOVwyI//aiE6WgeON1Nb/UccJYUURVID/YMml5IFX+CrlRK
	pZUb2Uj6OJd5LnEv6jmwQ4QC6C8n2WaGBnSaxU/eHa0BdfR2P5DEWXg/9RO91vQcQM4LhJ
	EgaXVKx69iGEAMyjMiZTuKdk0ube/zU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-503-gOD5eKIEPXegO1arjrXdyQ-1; Wed,
 24 Sep 2025 18:13:08 -0400
X-MC-Unique: gOD5eKIEPXegO1arjrXdyQ-1
X-Mimecast-MFC-AGG-ID: gOD5eKIEPXegO1arjrXdyQ_1758751987
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6241D180057F;
	Wed, 24 Sep 2025 22:13:07 +0000 (UTC)
Received: from [172.20.26.51] (unknown [10.30.44.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A910C180035E;
	Wed, 24 Sep 2025 22:13:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.17.0-rc7,
 upstream-arm-next, 0f3be52b)
Date: Wed, 24 Sep 2025 22:13:06 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <53899.125092418130800929@us-mta-503.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S2vpQl9JnAgtFObdGhdHpcvPGEr9DHF9Fap5m6aWc6I_1758751987
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_151313_840585_09FC9C00 
X-CRM114-Status: UNSURE (   7.42  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2060415554


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


