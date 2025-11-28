Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB872CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 05:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=URYOyuSihBlrL9lQLrZ4Jkqiij7j+E9p9zp5rPjM6vE=; b=oDQX/UMaMUWp1Ki7snn0N2P7Ek
	4qI/dKJ96GtuvblHGqqNzvN3yh3uGCRhrcqM1X18xIy9SvsFd6Vq1EhYoIfpfcdJh9Yp6gSKMe4gM
	VAL9h7Q0EArt57X8BzYzkRVFyHyEJNw5uloUW3MMRYcxp0ru+3Or/IMswAOp0q8+5lzVmYoIKPXkM
	aUdp1yf0BoCfgIV0Pp7g4xQ2Wy4a+KMznflPUgZKS1P9CyAA/STyF+2aA8F2sqbCk7pSO7nrQjAKb
	nhL1t/8drqlrq3F2t6zx+VuJD3QDmVYSJLe8I2DAW0b/+H/0fR2rYXAekSWUxNOQmS09YD1VVBSn9
	s732mD3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOqw2-0000000HarS-1nKy;
	Fri, 28 Nov 2025 05:22:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOqvy-0000000Haqh-1m5R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 05:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764307335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=URYOyuSihBlrL9lQLrZ4Jkqiij7j+E9p9zp5rPjM6vE=;
	b=hGr+j+T74MKi72UL2KsNgT8pmBi0ftPTP7d/Odyq782cjZ0gG6U8G6tCSkBZhm5/Bn+nIQ
	EBXvzWUH7xXciVt4cU4Pc2boldCkNZ4qCAYHtVh5/hnm3mkcUwDHlso/2Owx0hkQGpMpz9
	jb4tlN18/xP5rY9ojIeTQudTOi1Fx8k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-498-z1Cqb2eaMvuM_ByH3EHjjw-1; Fri,
 28 Nov 2025 00:22:13 -0500
X-MC-Unique: z1Cqb2eaMvuM_ByH3EHjjw-1
X-Mimecast-MFC-AGG-ID: z1Cqb2eaMvuM_ByH3EHjjw_1764307332
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69B781955D99;
	Fri, 28 Nov 2025 05:22:08 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B47081800451;
	Fri, 28 Nov 2025 05:22:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.18.0-rc7,
 upstream-arm-next, 56b28b3b)
Date: Fri, 28 Nov 2025 05:22:06 -0000
To: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <68680.125112800221400118@us-mta-498.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YNxz_JdVeshwWpSCdaLQyoflKvaV-4EbpK62v28mxjQ_1764307332
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_212218_873560_B08A5DB0 
X-CRM114-Status: UNSURE (   6.13  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2183899272


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


