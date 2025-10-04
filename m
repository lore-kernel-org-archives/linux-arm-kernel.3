Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F9DCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Oct 2025 02:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D65Z4HqbH5fqtWhTWQIoJmtesb5HnONvZSASibAwwEs=; b=AGK6Ihls2526+kHmByEnTLiC9X
	kjDVSRd0ELMr5K581QqqSJNvznnk/1QHNQfYS6gaURsAf0PgORnTgtIw6hU+UyRq/KfriPZ1LRMTy
	7Q9XtLNg29cUA1aJ/WNiuk81AsU6MumdAOhfARrkK59MHB55q/47rT4iFwyyTCFEZxL4cMuGKYVTG
	znLSojxtDQWC8zoSJ07/BLInFXx9QBSD6kgxv+eRsbDk2jWF030/cKt9zUVbVnQUWQcNJ1POtbRft
	0gBklLqkEB22+8pEU5COdtVo9Ohofk4Qe0Ot7A5UDc8hH7blSD3+ALTLtp1jvjLdqv7f5r/xcIlNQ
	GWQE0emQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4rl3-0000000DNcG-2yTn;
	Sat, 04 Oct 2025 02:12:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4rl1-0000000DNbY-08Gi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Oct 2025 02:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759543937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D65Z4HqbH5fqtWhTWQIoJmtesb5HnONvZSASibAwwEs=;
	b=O/FrzR9kAVkD84RrkPdOC3jMWVpRFkD46m4sW0ywm7hhBKDgWsR5/80XaJ1rRsBOYCG0NX
	qsUBY0r6Ws7E3rysrVT6pSvTmT++MgqGvXhrnXeqYerSWo1Aknn0plC/p9d10uOiJBU06T
	g7T46dxP8C5jTc3L91DHnLNNNHAqfGg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-480-1hVTpkkMM2uF17G-PT_kAA-1; Fri,
 03 Oct 2025 22:12:14 -0400
X-MC-Unique: 1hVTpkkMM2uF17G-PT_kAA-1
X-Mimecast-MFC-AGG-ID: 1hVTpkkMM2uF17G-PT_kAA_1759543933
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE221180047F;
	Sat,  4 Oct 2025 02:12:07 +0000 (UTC)
Received: from [172.20.150.82] (unknown [10.30.45.111])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF40319560B1;
	Sat,  4 Oct 2025 02:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.17.0-rc7,
 upstream-arm-next, bf45a62b)
Date: Sat, 04 Oct 2025 02:12:06 -0000
To: catalin.marinas@arm.com, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <90419.125100322121400172@us-mta-480.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZNdzBo0VEL7HdwhE9M9RJcT1AD6vZIjSNwDycw9Q-kE_1759543933
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_191223_321985_B40FF941 
X-CRM114-Status: UNSURE (   6.37  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2079202349


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


