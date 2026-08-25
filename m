Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8CFC61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09R/wRu2zvnjeauEgS9ECgH57/PNZjuVq3JPSTff+8I=; b=ySn1YZx+UD9TNBqmrF0nQZwF/9
	0Y8S355w0djBuC9kpovCySVEpLL9pJ3MhpufBwJTZpLSSG/PiIbHRX1HlXoV2PDgCVHCdpVEP6LRB
	zQw02TQAViQE6QAKuwxP2sePd6NHJt1iKWbCwezRV1tSaAaKPh3moggrl8RjLG5rr39XS2Qb/S3mI
	w0V3pLZqCl6bwK9TAiWA3dTOVsQjoEFs/796qwAJ/pf7jUKDC9ov6LLK1HUlCRoM+uTOZEbvshvt5
	AoWlLwXNYXVyd+AXFh+X1/hJX93rjaA+M7q8SC7CquJ8jcnCAFU4RHNaB8G8uh11ukkVprlQV6pak
	G5gkVF2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymbD-00000000OKU-0h36;
	Tue, 25 Aug 2026 08:33:39 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymbA-00000000OJb-2NmK;
	Tue, 25 Aug 2026 08:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787646800; x=1788251600; i=markus.elfring@web.de;
	bh=09R/wRu2zvnjeauEgS9ECgH57/PNZjuVq3JPSTff+8I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QekQwhhHAmySZcglpS9UZefC0hPJhXN8a+RhwaQiJtb8+BQkIcjUpwBoXba3Qiio
	 YLUZf+oqLKEt88h7iTZsq/GBd440kRSvFWRED7/nljFR9mn7bbaOafzFPp6RkzPa6
	 BiK5S/p72xGKK19xywMeP04Y4+IChmfbRgbuxSmz1ss6jQO1kbrOpx4nQyMXwX6bG
	 Xa/YqqIYwyuyMDA3xujq/AHA1ilxjbDcOm3obrshblq3ZgYRd/rveRZBB4uVJ99mb
	 K/vHr/1RSIvX6RIdiCzC2jZ9G35OwJJmBNU7stWxJO5LOSMwiGWAYPib+wWb1uGgA
	 zDJWw55+IyIbvKnAsg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M5QmF-1wxPYD2dhF-006IKn; Tue, 25
 Aug 2026 10:33:20 +0200
Message-ID: <4aa6dc37-56f7-4b17-a3d9-b29fcf0f4c37@web.de>
Date: Tue, 25 Aug 2026 10:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mailbox: mtk-cmdq: fix runtime PM usage counter leak
 in cmdq_mbox_flush
To: Manush Prajwal <manushprajwal555@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <6a8c8a31.ee10049a.195cf8.c6da@mx.google.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <6a8c8a31.ee10049a.195cf8.c6da@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HLAfb2dleXzgW2a4L0jtiQC3IkZ3THGOF6gmHmptppc3CLS1/DB
 B9EWO4VH7D9JyqnsZRj6iecuWXJ1uyBDgOhtUd7xC8oUnD0eREoO2iE7OfX27DQNwGTPxKb
 YL4e0IQqKiXPovG/c8US9TcpFHSkSX7hT8IEzacYrGt24DrnctAv73Y2wbVrTQ66a58hKeA
 RoDi9923UFTqaEh8tDE7Q==
UI-OutboundReport: notjunk:1;M01:P0:qOAd4icnHy8=;k63tamgYCZyapdLGrCIW6bTuHwy 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 TSHQPGMl0tZ7M2rJr9bikKRnHFbSI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013336_890573_514F9F9F 
X-CRM114-Status: UNSURE (   4.25  )
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

> cmdq_mbox_flush() calls pm_runtime_get_sync() and returns its error
> code directly on failure. =E2=80=A6
Can it be helpful to append parentheses also to a function name
in the summary phrase?

Regards,
Markus

