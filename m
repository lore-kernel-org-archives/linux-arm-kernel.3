Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43617CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zvV3TPPqPr7fS4Pa9aTemY9fapwJCDOmXbT7s//BMFg=; b=yXib8w8/OSYVGv0tjz88JPmYGZ
	2dtvLzeFq2gP+jb5mQ+uK14IaLpGs7AsSBxbeoopeP1IM96/YOSreDmKDpIUoS5265AFqqAhE5HXH
	b6P/MASZXs72+9gq5tKhx+KeQLatrGRSKqJL25HuTIes9GSMof1gfCqrt2uMXkto0YgIQz8wwetk0
	/SOE6ItcggudNp27pWS/yfIS/sNdz/uaQEZNM2SRrusLIRWYzOatDXv+0xpZdVi/7HgGJb5mJg3wk
	wiJalEOPuqCgaKKr+gi23ROTOz6M5FD3LIfmU90Enee3ARsg5z/etN2goRGJ07Ad7XQAMUcPuhUer
	o4Paq/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2mB-00000007dSB-0pPE;
	Thu, 23 Oct 2025 21:23:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2m7-00000007dRm-2CCZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 21:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761254589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zvV3TPPqPr7fS4Pa9aTemY9fapwJCDOmXbT7s//BMFg=;
	b=KJtcz9tEmdbcFUz3C1HIcCmcqGXdP6kWO6aI8jVVBwjIWHWEQZ7YNcQivaowUHpQG7tEc0
	XrFWWkYIRKHPi7cVHwwCWrFsNrTg5xphkV1UQbVuuqQ2A8/vQj6qYNdjPa8a6LQEQtxlAZ
	PoA/4kmo2zKJEfX6SmmZt2DcA5F/nq4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-108-pDcs2NtDNTWgcp9SEnZb9A-1; Thu,
 23 Oct 2025 17:23:06 -0400
X-MC-Unique: pDcs2NtDNTWgcp9SEnZb9A-1
X-Mimecast-MFC-AGG-ID: pDcs2NtDNTWgcp9SEnZb9A_1761254586
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3A1719560AF;
	Thu, 23 Oct 2025 21:23:04 +0000 (UTC)
Received: from [172.20.84.201] (unknown [10.30.45.119])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 65A2418003FC;
	Thu, 23 Oct 2025 21:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.18.0-rc1,
 upstream-arm-next, b98c94ee)
Date: Thu, 23 Oct 2025 21:23:03 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <03123.125102317230700237@us-mta-108.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bqs2G0ehrYx_hx1wpb7-0FcWd0kwyZW1dpR3jAW2W0w_1761254586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_142311_635163_D50BFDC5 
X-CRM114-Status: UNSURE (   6.91  )
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
    Commit message: arm64: mte: Do not warn if the page is already tagged i=
n copy_highpage()

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2116973438


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


