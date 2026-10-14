Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76576CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-Id:MIME-Version:To:Date:Subject:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=luFA3M8iJDEjYQKkTt9bQWNEwCOCJKRU2TiOe6VX7ts=; b=dTwP5bHJCfbPUuuKu1uEcocZ0S
	PgZYCjRuqaOnWkO5EaxVKYDG8qWkjGKRgawyQmi1NNYNJgk/BGgR78p8ESjsNrfSqBBx8lNeDBE1M
	GP8dpO0nM0OqEW6sMQcBvT+pfBqWH/hyO3DG2fAqCeyT/vyHFy5VzMhwBUC8ABFonHZDdpQWZbCT7
	dsifFQJGJ2AUaAv6PIfg60PU/1tCfPRjXg9F2MX3R3GRijweDv37jW5IEebRUwYYbpx0xs9Qo7jMj
	Yhd7OY2vQ2NwhG8RjR6MnV5t5OwN0ZoJdBJGiXDUzGS65EvJe+6y5ZlxkDA1WXimcfK2y2wEwqFJc
	pmZRIpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6tT-0000000GNbV-0xnG;
	Wed, 14 Oct 2026 21:52:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6tO-0000000GNb0-1ZN9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792014729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=luFA3M8iJDEjYQKkTt9bQWNEwCOCJKRU2TiOe6VX7ts=;
	b=We9ZGO7G/p6MyYIu3SdHsaCy8gUssvXvQIIRRzwyqKpT/cD4ewYgB0TxTl+0e6OjT5ECT6
	NJSQy0iIkUULOfhi+z53g+KGMZ0QK8X8v/bZMw1H3JrNOkgBRy3SO8IRKk2x2yCYPO3er1
	tX5LTh817uOk6IbDdI1J5POKybyfhwk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-515-ZooB6ZgMMp-axWORu3tXwA-1; Wed,
 14 Oct 2026 21:52:06 +0000
X-MC-Unique: ZooB6ZgMMp-axWORu3tXwA-1
X-Mimecast-MFC-AGG-ID: ZooB6ZgMMp-axWORu3tXwA_1792014725
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 505631800D89;
	Wed, 14 Oct 2026 21:52:05 +0000 (UTC)
Received: from [172.20.178.115] (unknown [10.30.44.133])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C4D2B1956042;
	Wed, 14 Oct 2026 21:52:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for for-kernelci
 (upstream-arm-next)
Date: Wed, 14 Oct 2026 21:52:03 -0000
To: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <66501.126101417520601209@us-mta-515.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dYy6BBfG2VGChite95xGVKY08KnvWadnFvv54sJOyEE_1792014725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_145210_486050_3A16BE92 
X-CRM114-Status: UNSURE (   6.48  )
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

    Overall result: FAILED
             Merge: FAILED


You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2947671969



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


