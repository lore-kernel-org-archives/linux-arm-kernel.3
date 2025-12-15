Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F34D5B170
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 17:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ja9Hg/6jdomRAc5p9N6p8aFKV+8j7gnQ9qOwI5/OuY=; b=yrbnWtgZG0v2o0Wivi20uvq0Pt
	aJffYehujHO9vgXiXKTT2QbhuIkbzQ6KGyLxzD1afTtKIQoJiRIKoMrJDx+Y/HONeKfpRF35gzW0L
	zrryPu6OJJsyUGMpy4kp9B8QU+RLH7XipUcaYpYHSeflsxMEcLRAlr/cZ2BIIx4YgiZ67T7llc8h6
	G71Kl/yyua4d3dk9hHj3rObjJzC1+IPH/CoYnRpJOmsSqhulP0Juy4m/cT5D1VpcCOZMyadHhDkkR
	2zjp7xm3xWub6d5F/xVWnojwbnWPsgqRl/f04YP+A9ry9RAGbB7HgIxsJuRR0DYwM7jgoXdPQ94i2
	uSCyoZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCbJ-00000004596-3sgc;
	Mon, 15 Dec 2025 17:43:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCbH-0000000458j-0JNp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 17:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765820588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+ja9Hg/6jdomRAc5p9N6p8aFKV+8j7gnQ9qOwI5/OuY=;
	b=TCktwdRqDIbyBSvzCCCFSz5d/NaeoMMRWpVbzPWoT9NddLxKqrXCsKR0LIZkrlkCVVyuIj
	x39U4svwHJlJ52IsEyf9alDwxZuwgXtXecU+Zs95VCK17dfQIyZ4UxzTAkvOPOXBJT8k9n
	/2Dm6uH8C+fpgfu67yqeMPV9TFeVT38=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-yjm_VGTXPayI-TU2MbSW4g-1; Mon,
 15 Dec 2025 12:43:04 -0500
X-MC-Unique: yjm_VGTXPayI-TU2MbSW4g-1
X-Mimecast-MFC-AGG-ID: yjm_VGTXPayI-TU2MbSW4g_1765820584
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 702E11956094;
	Mon, 15 Dec 2025 17:43:03 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 526B71956056;
	Mon, 15 Dec 2025 17:43:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.19.0-rc1,
 upstream-arm-next, 8f0b4cce)
Date: Mon, 15 Dec 2025 17:43:02 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <74421.125121512430402225@us-mta-217.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: utnR8k6IVcuH4AwSIR6zF1LrhcQwjFa_rkjA86jAMpI_1765820584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_094311_207402_432E0A61 
X-CRM114-Status: UNSURE (   6.26  )
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
    Commit message: Linux 6.19-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2215260160


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


