Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE54C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DNd0y6bRBKGSvf6tlnnPK3+Q1DvlcCndIqMf/J8ccLA=; b=uEpWB1NfvhOkltzP8WoJiADNds
	i2tDrQozayziR6GKr9lnOhdAXdMB2Kp9gYmZN1QexL+crNMcU6nT9XaqQ44K5XJRV/rsKLIyyIRuv
	pJw/brV2KkyHfidUgHQALlNTVSqSNV5AasnNmMoZRBeceGjZr7dP73Ff3NN5UOLXpBzmoSzCXHLXV
	yXGPcrFwi3vAPw7OGE48LfxzrHc9mYYEqqzsQXeaj49eoHih/+5lFD3LcZxa1saqkBfqQc5B0XOft
	y/KQMnIltlSxtqIyktsnk4kEFn/R3vDoi/DFOQ/70GJax9fUQlQDeG1prITKrH21VqOyRBtkCk38+
	2NHBihlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxu-00000004usD-2mg4;
	Fri, 09 May 2025 21:09:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUXs-00000004sHl-2co5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 20:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746823331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DNd0y6bRBKGSvf6tlnnPK3+Q1DvlcCndIqMf/J8ccLA=;
	b=F4nCtoNdn+YEwkaVUCyvC7N8J6ceE4a1FqObtGhTq101/6nJKVwcZ4dE78Wj/QOzCWNR9c
	CJaxsE5gKJiOGo4GZQUekRdKcOivsWaHVfrb6tO45ISU6YtQo+5mXD95CgjQN8EqgOD0UP
	2i0wgp7Is/quSvtpN10xTUiBhddupjw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-kjesexUzOcOJ-H3rdc3ZPg-1; Fri,
 09 May 2025 16:42:09 -0400
X-MC-Unique: kjesexUzOcOJ-H3rdc3ZPg-1
X-Mimecast-MFC-AGG-ID: kjesexUzOcOJ-H3rdc3ZPg_1746823328
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E582C1800446;
	Fri,  9 May 2025 20:42:06 +0000 (UTC)
Received: from [172.20.110.75] (unknown [10.30.44.189])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F011E30001A1;
	Fri,  9 May 2025 20:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for for-kernelci (6.15.0-rc5,
 upstream-arm-next, ac57c6b0)
Date: Fri, 09 May 2025 20:42:05 -0000
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <35277.125050916420901267@us-mta-642.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qn9L9ubLVI7v_-Z5obc2hTuCEChgRSmWxN1w36I4_Gc_1746823328
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_134212_734957_09E0E116 
X-CRM114-Status: UNSURE (   7.08  )
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1809844667


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


