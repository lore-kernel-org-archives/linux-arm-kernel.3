Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE846CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Cq0DHB5k0l5CQs6BVZUFt4lPJTtmejSvjf3feeP/U8=; b=IyBBRMe9Z/2rSbZZPucQZDDv1U
	jY29qj2aMenlSAGEEqMMd1nnCOvHGFfPF4JZK1Uihr/p/e/Y7VSGoqAuUnKeNsfYPG8aAGdfZzhnh
	Md6LDoVa+2LqSEoGZ938kq1c9AOWRnZtU/8MEnvztVHraPr4HJAz9L5px/TEYAWzVG88GWbfJZ6eI
	pKUqrG1bhrf2sT+GmVN8wdXmyn97Zmkvg2svTuKga0U0vduxoGTST0j+e4iORywt6Vsv0lGHAj5Mf
	d7gJpRVEn31hRrmE9HEtmdAtyAK1U+EixVx9q1hEeIXVqIk44Q0cUy2m0R1nDul7O8zADxxBupNH/
	tkMqeUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFLL-0000000CaPb-28K5;
	Wed, 10 Sep 2025 07:34:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFLK-0000000CaOj-0g4Y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7Cq0DHB5k0l5CQs6BVZUFt4lPJTtmejSvjf3feeP/U8=; b=dhDLTbqePQivfMtuUSxPoHG6q7
	UVsOfJlaQAz8Avn5Ifkupp5N9gevxTnP3AtyvBl7Ya2ySQj8Hp/56jOU69Evur/ML+b/Aah8Y3nt7
	eYVoptqmHnhPERmDz7lDsgw/khQXqjb/uCRM+gP5/bedi/XKEqQ3llGnUxA5J6Rw+K2mk3vpIwoE+
	D1TDUqf89PU81+ThQS++A9PjXMsInOr//dB6mOW0QVEUvk83WENnKSd6IpHnIMYW14YzYuw9tz+/q
	yLKpRO9oInliGVTFxK5++EeEfMe9EQoAHW8UupUCUoT8ohKCcVn5QOBLu7++XUrZUZSnKV3v8UQrp
	pASbz/zQ==;
Received: from mail.bizosto.pl ([151.80.59.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFLH-00000005lc5-1pqF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:34:13 +0000
Received: by mail.bizosto.pl (Postfix, from userid 1002)
	id B10D4208C7; Wed, 10 Sep 2025 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizosto.pl; s=mail;
	t=1757489649; bh=7Cq0DHB5k0l5CQs6BVZUFt4lPJTtmejSvjf3feeP/U8=;
	h=Date:From:To:Subject:From;
	b=jREnp7N8ebUdGiQNYvHyqOdZ3+lBW/s9ukiAHCyhqYpQ+9GOyasGgINbRGxfWazjn
	 bwn1AMGhuN/C4Zwcon2jSw7oE1OnVsT1ic5iyDAvlX7D4LaOtZA+bjU6jfTVOGr5vX
	 zqroPqCTzUdmNfxoXScynvokHV+0fBcXMCX9XfDyU35wHRUJBD3iOFljhdwqmS+Cnf
	 Wq/uUvnaF8EKI0cBnWyJtxpiU/hBScBcEeFByu7mgNaZ86Ut5W+MZPh0ffVDAq5/VF
	 Ty/xy/K6j7k/CMPhrF03kH/O9ffZ7l6ncJwZ1YND3w3c5kvt1W1H7DZQ0h43e7t8Xw
	 HzU1IfhMaUVLw==
Received: by mail.bizosto.pl for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 07:31:08 GMT
Message-ID: <20250910064500-0.1.3v.1ah36.0.mghugyc3fl@bizosto.pl>
Date: Wed, 10 Sep 2025 07:31:08 GMT
From: "Kamil Nakielski" <kamil.nakielski@bizosto.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Zatrudnienie nowej osoby
X-Mailer: mail.bizosto.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_083411_582716_C19DC0EC 
X-CRM114-Status: UNSURE (   3.09  )
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

Dzie=C5=84 dobry,

kontaktuj=C4=99 si=C4=99 w sprawie zatrudnienia pracownik=C3=B3w z Ukrain=
y w Pa=C5=84stwa zak=C5=82adzie.

Stale obs=C5=82ugujemy firmy produkcyjne w tym temacie. Je=C5=9Bli potrze=
bujecie Pa=C5=84stwo dodatkowego personelu do pracy, prosz=C4=99 o wiadom=
o=C5=9B=C4=87.=20


Pozdrawiam
Kamil Nakielski

