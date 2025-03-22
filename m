Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678C4C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 13:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjUf1ryZi1oB5Nn5ayqZmUpZSv1nmZtfvq35vnb/yRU=; b=tG5kF2qa18k8YTQTxKl+N6oDT1
	Q4VTqhjKVtrrMG5o5EO0EpxlazXz2LQ5exPJuULwf2gyPmNIJtlrmwHXWdHdreiti6s8uljAxBiVd
	3z8n1lOfMq4bOeK02Owb6zUsUjkS7zfTeql8REqfAULlDmY8BFoqnCHN7r8eMYcnhce467SlSriRZ
	sDKyJbOQUXSZ8Xvt33kmNiky8lpspZGIGLIHEz/tpTUOR+Nbmy8dTME7pEXsT61WFyonZCkTUunuo
	1Nt37iJWOXb2rk79Xo1EADwENbhSTgBxyG630JHZ3MlxMrrKHIDYEE2cU5EtuTp4WgjSQ+8byDH+F
	3DJQwgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvz72-0000000HShj-0FJv;
	Sat, 22 Mar 2025 13:42:08 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvz5L-0000000HSad-35Ti;
	Sat, 22 Mar 2025 13:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742650807; x=1743255607; i=markus.elfring@web.de;
	bh=xjUf1ryZi1oB5Nn5ayqZmUpZSv1nmZtfvq35vnb/yRU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AmAu4Y5siP8bgaxCR/tjJpZDXc4vBtRdtx2dN0LBAxfsBeIOXhj7N1F+R7BdAmA0
	 8Os3zQURBeGuVmRhotQf81yEbRVonsvgzZmfgjiIasFbjPXaxDwkBx5/khVSmG+MI
	 x6GXMu3Qfrczs+zLtMCQavjR1FlCGaJkQsdJgsUXNlHvH6v6g8HJ1W5zBvdF46ywo
	 4ZvXCLOTgPJEHZPgmtByHHiMq+MLz6/MwfwSFCBzWZgvCIoCtrwt0Pj1G8ukqAB5L
	 8wJ2vDaEQ112v+mRKIaqpt+ZqURlHAfFWGqty+1HnC18PQzUMqzK/kPOdhyogucJK
	 BaPYzqjYLA6PXNyOJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.73]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwR4R-1t4Hvm3Edp-016Jbe; Sat, 22
 Mar 2025 14:40:07 +0100
Message-ID: <52071c76-dd06-4b11-bb79-a5e0c28b94ca@web.de>
Date: Sat, 22 Mar 2025 14:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bo Jiao <bo.jiao@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes@sipsolutions.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
References: <20250322105052.19136-1-qasdev00@gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid NULL pointer dereference in
 mt7996_set_monitor()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250322105052.19136-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hzCFADGYDQPr010FsI8NS36pmqMY5yW3QkMd+OSetiqm5SCom4J
 7AjbzuRM69zCOx9flAZw0f6Q2kfc9mfXIfyPHQ9dZKyMtyex+p5/HYFXnkSPf5+n2iE2rra
 egN+bJ+bR6yR5s0wg5v/3Lrdi8+A3Yh5+XbtrgbGVlQ49JLjVsnHnME90Mp40SdN2C/3SDa
 /B5nCfICHGfKstaODc0yg==
UI-OutboundReport: notjunk:1;M01:P0:n8ATnK4I5Oo=;Kxt+BdHKzWc+Hw88z3c4SFWzJd3
 8Z98fF/4yja44CleXzzt0MBLe5L9ZsvAgg7WznESaEm82dFuC6mLRf8n4h9wXk6XmzzEcgZEl
 dgPnTsgn1eIGnk0MIZqfP2IEYs8BklNiVxIy/zRyu4JsGkjujf1V6z0vQkOf4EoaHI36M7ahV
 7zjIaf0Rcg6QS508Zk06o8xnga6OstVcrrN89cY3f4uddAomk8yWo/1OJyq1Kxcvaea2GxPCO
 aGzBeTfnqQXETpVj2iGkiS6vA37soRG8zSZhjVRU62n7r0RfgLSd1zc/KUHNNtrNG3B31fZOv
 NzKFO/3AunErQo8qD2Ll+URYFwuuwdMZFr2LLgGswAFNKPoKOxEyrKp4nmCnGH3BpMayZRq8j
 Yj+8fBQmlXWW90yBun8M0XkKCAcXobjfhPl6X2d+87yS+XAH2RwFsPnzCtRPHtVqZPW3eKpkT
 DaCYyxQ5LLUAD2yS6jeki97TaWPG68Su/R45hNUJx/6DH6yqv1GnwChBc9EGlyYqSdzf0J6zq
 jjRstdAUhY6QIQ0iOmOBCGI3rn2mYawx7i6NhUhqZJC3KBxoHgKL0vcaqqAhKQoUm3r+hdkrt
 lTJKLuITpLaDKQWsOxKAN9nbhh6P5cav1Kaap4JGbCfr9uuej0hZ6y3PP8WGRA380Y0kyKhZ1
 4u6d1ZPnXYasfvwCPPiInGZ4bdxbTP1vzA/iy4sO2of44wQ8zk1NC4A3aoai2RT8OfKl8YCoR
 hqVxPQQ6Koij0nmTklNdgP4nayDjuff2xpQ7B8oTWEV7ghRJoL9904KiXMUuiDARg+/nN0H67
 s3ZrJktIQXThuUSjTflH9ClguGqlI23CwNj9LsqC55CLULowbDqplaoNCEy6nnMYcFicpVjWJ
 fDFivJno7jO9NsepDyaMuyF6s/nyeL1IQCjqNubMdXMjaSC7aQIaFtSiz4/+vJLx/smoQ3Dxv
 MRRPAHCR8URV1D31iBHtedxjIH24y4jkpFvM9j+vPWPD3hnxx2WLVIeDGXtQXlQ2OhoutP+Jt
 G7RImvr3kDPhXGnh7CODBOasOlatCUFf1gt06w76enNXhEiJj66mkoN8KSN3wZHizwEz64yry
 88SbxFStB1HKHlIZlVbTXflfaiyakSRp8b9WJqQR2b1+IXDFxdhkoGCAomFlp3XP0zlJPd8zX
 L9E1ebeYHUoaRnKdmdJ/GDu9ND+qDLmbliMTBrYOM3gwUJk9h+BzoJep+NxvQUSJNJkdUMVxS
 ZJFCZvYanSbpNMb1wgbGlF0t/s96eS8badeQ5voeJ6k+8Pl0kfI6SboiTs4McugH2O5GtRJ3I
 HJHG987uao+qmMjXMXBGwnJhAtdGp2lnvQV9Hvnnz09/I4cCF5GmFQewrPfao9qMVzs5rPref
 WLdRAD7fpSBZ5gV4zpl6IGdYYdxa8HZlhHGr6TCYVuFSOQLWGL0NsnUjpr1S8VDsu/cQX9LAU
 kLUo7SBH/5eJtXfCYpm94TK4/X/K23ySAeiq52M08xVuSrQq3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_064024_145684_22378B39 
X-CRM114-Status: UNSURE (   4.56  )
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

> The function mt7996_set_monitor() dereferences phy before
> the NULL sanity check.
>
> Fix this to avoid NULL pointer dereference by moving the
> dereference after the check.

Were any known source code analysis tools involved for this software impro=
vement?

Regards,
Markus

