Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35DDCA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mNa5M+9vTJYCcNQN4KQDtB6AOksdZU+/nHxZODPyyJE=; b=j5DEKiv2NUYp0JfyEpjGXqB1Xv
	AaUGutLUp+WHfl9XBco5DqkAe1IbFSKJZ0zCfjMN15ouXQxmiVfCD5Wx5B/J7/0yls1F73Hklj9Nc
	rAZs9CTyysIgyj3W086RoDASnsM+fgUbecjQEBtI2CjDWuHvP+fa3z4KOLny6L4CHA3d0dZlqHvYK
	jCajrrqFy5XDTNeGpcIGDrix6psMrWoeWMOQip2/sYSk6oM96AEr9IjKlD7T2L7BMlnXRVwUVmaJC
	hxbWPEQiO4mzOsKX/qegMlmXNar0meWEBTzsi9B3mzP8lnP2eZhW39ITMHCb60GKgD9+6kyOvobfx
	bEpwsfag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kPb-0000000B8ka-34Kk;
	Mon, 22 Sep 2025 17:33:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kPX-0000000B8ij-0JFe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 17:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758562388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mNa5M+9vTJYCcNQN4KQDtB6AOksdZU+/nHxZODPyyJE=;
	b=cF4zyU2/Pp5uaz2GeaZU9aYdXSCxEf6s/A7EeCxiwB5A6Fn6Q0DZQgdIm7TDdbrFlMybmL
	C6CN2JGJMtq6ypD1e9at5QxA86Zut5LWRbuo26LgMMsCmK11UrCSEp86iIC6TQi48OXASM
	276iFBUL9apzwzVhUD08foTOSd/4s3g=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-2kZi-xHWPVGU8tJFniDPOA-1; Mon,
 22 Sep 2025 13:33:07 -0400
X-MC-Unique: 2kZi-xHWPVGU8tJFniDPOA-1
X-Mimecast-MFC-AGG-ID: 2kZi-xHWPVGU8tJFniDPOA_1758562386
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FFCF19560AE;
	Mon, 22 Sep 2025 17:33:06 +0000 (UTC)
Received: from [172.20.26.51] (unknown [10.30.44.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 38DB21800447;
	Mon, 22 Sep 2025 17:33:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.17.0-rc7,
 upstream-arm-next, b5db4add)
Date: Mon, 22 Sep 2025 17:33:01 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <06822.125092213330701740@us-mta-687.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cnRgiqigvYp1gyGNfD_Z6Lxml_YZ2UBaYFG8nC9frYI_1758562386
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_103311_181420_ECF4FD31 
X-CRM114-Status: UNSURE (   7.68  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2054049436

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


