Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CB0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 23:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SN6fd6GK14O04DQG4SvtdSHUVyO6Ma1mthPxQVK0jEI=; b=zkE6EJ7Mr/LRbIymcwN7RRQrCv
	D59SZ5b6ppNVhcpjv1qQbI3Ucaf1GlHbhBqFO4/uMc6gIGnQQvd4tOY6s2li7WhP00oX1O57nFYTN
	5tZiDhHun4AE7YtUjJD+kgWj1t48YST+pTWLy+Rj/jxQEAt3RQ3AHsmA3lK9CDSH3nmMOP/KXYeJE
	ilKXeKMhkksTZ3IqdDAPHusqbkHG+qk65/wW0TGJcQsMvHKH/8ElFx/g2j+OXNUkLlMTNL+p3wFkY
	XjxywftD8AC7zRrQKJ1wp/Fd9aMye89TqoMxISAFBX3tlpI2kXPNhRVgvxHsbfx3gPJMUehyjOuEe
	EbpYqAoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiWt-000000066vs-40O1;
	Wed, 23 Jul 2025 23:05:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiUQ-000000066XR-0g0v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753311787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SN6fd6GK14O04DQG4SvtdSHUVyO6Ma1mthPxQVK0jEI=;
	b=XHZO4MHKPeIqIS7Jc2Q2MqZuc+19gtHpZOFTm9hnP4bh7iWB1oCFGT/Xa5w7LK0mYtsRQT
	MeNN1qJm4/9KqElW8go9ffIa4NhFSo9rEZX7jNmFUpA1Em0NAgj3ID6jFmByFTHI+tQtE2
	yAyYT0j2ovrYP3C5CXtZN3RtyuvaT6s=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88--Ci391NOMLmzjnBZyaJDqg-1; Wed,
 23 Jul 2025 19:03:04 -0400
X-MC-Unique: -Ci391NOMLmzjnBZyaJDqg-1
X-Mimecast-MFC-AGG-ID: -Ci391NOMLmzjnBZyaJDqg_1753311783
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E5A7180034E;
	Wed, 23 Jul 2025 23:03:03 +0000 (UTC)
Received: from [172.20.247.27] (unknown [10.30.45.30])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 49DF4180049D;
	Wed, 23 Jul 2025 23:03:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.16.0-rc7,
 upstream-arm-next, ce5c617e)
Date: Wed, 23 Jul 2025 23:03:02 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <33008.125072319030500123@us-mta-88.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dE7DLWu0grTDwMql57r1GdDRMQ3UruqBpiaHJc9o8wk_1753311783
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_160310_630134_C9BDD4BB 
X-CRM114-Status: UNSURE (   6.87  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1944424773


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


