Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7701FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 23:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UN5GMXES+q82IEUxdO7KcvBdU4pF9d499+NH9uC/d04=; b=EPqq6jCozw8Lq1
	TIQ0LPiDOFWpA6YnCVldRnCvL0lhAto6fjuAbZamHRpxsa+ITHRHwE2mitbj6mReRm4VBhQx2mp6h
	9M4A9P6tZMQ4KvcslKPnaN7tEstYEhbEd8RHvvW2MwHkbkd+drXCBWY0L/OCdjZzSsqlAIYQsUjqI
	E9fgpZO6/SCOfarnsEfbRbhZkA+vI+9qwVTn6Zz1ylzRkDkQfVpLt5J6AgcC4GhLzGtixUUFTKTNK
	8hGq1KLrWg5XNXsgwIiokViS8srcZM5Mmy+9QIzudncO/9UE75aguhPSFzX3iLXj4nHG4e4KbDj9v
	5d/RPyfNY7esE2AQk7Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH91I-0000000FwLO-1RHE;
	Sun, 26 Apr 2026 23:36:12 +0000
Received: from mail.machinerydmaster.com ([158.220.101.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH91F-0000000FwL5-3v6L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 23:36:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.machinerydmaster.com (Postfix) with ESMTP id E862615A39C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 11:14:17 +0200 (CEST)
Received: from mail.machinerydmaster.com ([127.0.0.1])
 by localhost (mail.machinerydmaster.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id TXuGvm_eH4W5 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 24 Apr 2026 11:14:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.machinerydmaster.com (Postfix) with ESMTP id D8473159F3F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 10:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.machinerydmaster.com D8473159F3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=machinerydmaster.com; s=99533872-1899-11F1-A79C-0C2B862F775B;
	t=1777021038; bh=UN5GMXES+q82IEUxdO7KcvBdU4pF9d499+NH9uC/d04=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=wAzMStW0Zfi6IXZ4kIgtJ+t6TqVny1TpVv0BCCyYiIC7HU3Q38x8ler8eqbWnu9Wx
	 A8U2a8IenHW7WRuqrFdN4O70pMkeyaGVSp8pAQ5n5c/l0QJwitwspAluxTynwAAeKf
	 54QNsoAd3dqEUsenUrrkgrCYlxP0qHwnw69kW+e8ED03lGIRUn2lsGbOzE23iALkRc
	 8Y3XQUPWPYeUncmmzL2hziQ6DmzhLpkPJE2CJH7mnRGQSPjyXVHLuDymkf9zrx0Dif
	 CAg+AiMizBli+2VoPgABB7AKz3ASuGaKh3Dq3f9G37DZSvVikqVsGM//+dZlYfvu23
	 f48qgCuh2/ilA==
X-Virus-Scanned: amavis at machinerydmaster.com
Received: from mail.machinerydmaster.com ([127.0.0.1])
 by localhost (mail.machinerydmaster.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id fMFcIyzNK7DT for <linux-arm-kernel@lists.infradead.org>;
 Fri, 24 Apr 2026 10:57:17 +0200 (CEST)
Received: from [91.92.241.130] (unknown [91.92.241.130])
	by mail.machinerydmaster.com (Postfix) with ESMTPSA id 31C60159B4C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 10:52:23 +0200 (CEST)
From: "Andriana Agathocleous"<ezra_sage@machinerydmaster.com>
To: linux-arm-kernel@lists.infradead.org
Subject: New Order- REQUEST FOR QUOTATION-URGENT
Date: 24 Apr 2026 01:52:22 -0700
Message-ID: <20260424015222.979652FC9F50CE7B@machinerydmaster.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_163610_122474_692DBB51 
X-CRM114-Status: UNSURE (  -0.64  )
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
Reply-To: Andriana Agathocleous <andrianaagathocleous@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Dear Sir/Madam,

Good day.

I am Andriana Agathocleous , Due to our recent project, we want=20
to make inquiries about your products and we wish to establish a=20
potential business cooperation with your Company. I will send=20
requirements for your perusal and quote upon receiving your=20
feedback.

Please kindly send your current catalogue, price list, payment=20
terms.

Kindly acknowledge this communication and send me feedback upon=20
receipt so we can place the order without any further delays.

Best Regards,
Andriana Agathocleous

