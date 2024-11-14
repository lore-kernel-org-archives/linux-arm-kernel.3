Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B434DD68B32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZlXediQFwa1jXgmv8xX/GX4+kCRPu8W9XhXLyJ2m8Y=; b=vaHSev7kRH7gxUYplqSFZj6nRl
	DhcsfIX6xhFfa/h0ec0UM/bPy56ItKolwHEV0BugMbYoMlkUC1ldZwnd7Kq4uz+ERYgvF3kO3PTF4
	WTcghlI9BNw/dxgEapMAZsAK5vXIEDcfPnWAFBIRGeY05HQHfcWFn7Lq3i8IKuGraPgWYLT9GfuH/
	RLUvEZGDgoy0ObR+YO/K0Dn1hTohsmLb+iCi9XuuTRdaxKcuvHCer9TEySO83dleLIiz/vHyFPgQA
	lInS3Y/bGY/WZtR2a6WbUI3PR+BenrbXG6loBLePUgzix6YWUmem4GDcLvxdtpdRYYgFtzZZI0YSa
	7noVb51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbss-000000002Sa-08I1;
	Thu, 14 Nov 2024 15:35:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbrg-0000000010t-1nS9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 15:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731598473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TZlXediQFwa1jXgmv8xX/GX4+kCRPu8W9XhXLyJ2m8Y=;
	b=WRJBhlsEIvXfO5Wt1eFhTOUyUV8U7oHBWRkbkERz7UCWC61CBHvudOMiMKrYS9bzYkTmJY
	9fT41aKkdpbtUggj+i85Ki554cvBwQrmERgyMvX4qQgmTbqF3M6hiuG12oFxXED0XVWRC4
	9xy6GrJJZ6iqrbTDM4lR2FLDKtzj6Q0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-sjSLgoxAOACESXkakonGCA-1; Thu,
 14 Nov 2024 10:33:04 -0500
X-MC-Unique: sjSLgoxAOACESXkakonGCA-1
X-Mimecast-MFC-AGG-ID: sjSLgoxAOACESXkakonGCA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 86F011956088;
	Thu, 14 Nov 2024 15:33:03 +0000 (UTC)
Received: from [172.64.11.46] (unknown [10.30.34.132])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C4D6B1955F3D;
	Thu, 14 Nov 2024 15:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.12.0-rc7,
 upstream-arm-next, 88740716)
Date: Thu, 14 Nov 2024 15:33:02 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <54866.124111410330402401@us-mta-237.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yz3zsC0aTzqscRd2LbBKCvO541Bss6aIL_BuqvZzDk4_1731598383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_073436_548705_B9E5D07D 
X-CRM114-Status: UNSURE (   6.50  )
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
    Commit message: Merge remote-tracking branch 'iommu/arm/smmu' into for-=
kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1542828459


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


