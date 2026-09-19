Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F7BC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 03:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V7ZeDtTSb+jLXCxujO3K8h3gTIA3TpCdlCGlIlZlGSQ=; b=vJ8crdWEXzLx2gJBvsPtk+h2Uo
	EFyA/+mBeyvBJtOckUm25wm0sn0G4DSfNrk3R4Gac99z/H+E1IGA9RjP+o9u5eJtOMYfZhHGuNz9E
	nkF/ZJ4n7EaUQ92dcnf18MPwNrDgBqocmVvsnaPZPLDFIV9s6+jFVlBrJtQVc/HDwrPVFR6EUTlvl
	26a92ndy4ICnxhIJNqwOJTcChqcshhHBXYFtoIwFxkJ/HS9CHne4hn/dhEQGXFGxBytPukHHuwp/S
	Wr5oPxRitrR/Yj52437d3xNfbnHCEf5JucVOI8RzPCGGLI1ScJuT3Tutz097LJ4maa5syXFQV+A2a
	2LTbiIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7lpL-0000000Fv0l-1P1Q;
	Sat, 19 Sep 2026 03:33:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7lpI-0000000Fv0R-035M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 03:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789788794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=V7ZeDtTSb+jLXCxujO3K8h3gTIA3TpCdlCGlIlZlGSQ=;
	b=Xpwb79JkFeygNb40ql8vNSBAzy6kTouFTVhXx/2eUW7WGG7hNFMGbyE7fJPENhHscZAO7/
	WVtU7OzTo4CZSGejRRq+2+vnZkmR/rsVJrkNBXwySj/B1QG/D3xe1x5G+4YZ3WaGgWrmqj
	9Iw4xMTdCBrVsF5I57FZoZHYNPioCPU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-286-W4wSDELSMgG7cL34eFPfmw-1; Fri,
 18 Sep 2026 23:33:07 -0400
X-MC-Unique: W4wSDELSMgG7cL34eFPfmw-1
X-Mimecast-MFC-AGG-ID: W4wSDELSMgG7cL34eFPfmw_1789788786
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5499118512FD;
	Sat, 19 Sep 2026 03:33:06 +0000 (UTC)
Received: from [172.20.179.182] (unknown [10.30.44.133])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98E2A1956086;
	Sat, 19 Sep 2026 03:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (7.3.0-rc3,
 upstream-arm-next, 38872197)
Date: Sat, 19 Sep 2026 03:33:04 -0000
To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <50193.126091823330701225@us-mta-286.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4t7CdJjANdcBkXG_lD1tn9fPJx6MSrMIeoWBkRcbtlo_1789788786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_203320_125216_CA2F014B 
X-CRM114-Status: UNSURE (   7.44  )
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
    Commit message: Merge branch 'for-next/fixes' into for-kernelci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2861646654

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] Hardware - Firmware test suite - auto-waive failu=
res
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/779
            Affected tests:
                Hardware - Firmware test suite [aarch64]
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


