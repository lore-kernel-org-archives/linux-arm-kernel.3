Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50838C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wsZJyigWi4VXhv0iWi6BonguYvhNMUA5fX0Vo4g9SM=; b=y1qewWHInqDcetKk7qAEMDuJn5
	2UWtv6nsIfsDMuBVqpmkcV6M0HgLFO4H2UXLiW1P0jWjX43fsO0O9EFsfATt2p1dz527s8bDIpAi8
	5Ecp4315VJEV4160mAxaw/AVS6fnY+BTm5eCn5xtjz1HQ/BxgeBjO/1MPLxqd0+EFlDQVssfC26ZL
	45mXQuVjJe3Q9cG2DTvWIz3XnJ9P+hcnhtzLzMCnW2UXWtvW5Ho57vesPNjbr21jHTi3C9HILkVlV
	d13Swi4nrVHHfNBNiTs1YIx9vrXR31XeFTPZahtxfe9iYyMdEGbNZan6DkbKxrLaXM1upqWRu/82j
	KEof52rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlp76-00000006zfm-4B2d;
	Mon, 20 Jul 2026 14:37:00 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlp75-00000006zf0-1JPF;
	Mon, 20 Jul 2026 14:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784558205; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zk2niH1F0FMDASBDJHW4T1D8LwCoRgcWxVsvlLMaRjbQsjeqcJRa4ZsIaWMHGl6mRLmN8TL9r3ieALJC+rC39gKlHV6J/DOfDElvc0TD9c1GVAoMG7stVx56dhHJxdq3XiKLr1fk25v9I6f2cHbGFbDXUydZm1lgWEgTWJKKyIE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784558205; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/wsZJyigWi4VXhv0iWi6BonguYvhNMUA5fX0Vo4g9SM=; 
	b=Bahm1CcytqwOeGqj/TFacnKL+gJo4FJlvSJU548ZSxhNJzrbjN+bJVdYSVbk7jwouMR4/4788vE9ggff4jBWxGXf9dqpJ/NhiTOmC+jd4cvez/0V9OLTx9h2bRRnXIEVkPuhwqxXvkv8ZlggfrB2MuceuZtbS17QXBdC+IQVY64=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784558205;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/wsZJyigWi4VXhv0iWi6BonguYvhNMUA5fX0Vo4g9SM=;
	b=BfK2iFa8lQWfSq3+niadj8GnCtMfiaiB1NmvDt7uYAmxPYsCICQAdtxPDEQPT5Md
	vshKmokcYoTg814I1OXngSt73AjlHo7lJPN0KJ6bF6N10kZET7gJTNEOszitK3iRAB5
	7U5rhp2MSjOwZrDvX6jtGMy/J0PKdmg9hsuSax/k=
Received: by mx.zohomail.com with SMTPS id 1784558202613285.0487905776356;
	Mon, 20 Jul 2026 07:36:42 -0700 (PDT)
Message-ID: <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com>
Date: Mon, 20 Jul 2026 17:36:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture
 support
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718085728.6797-1-royalnet026@gmail.com>
 <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com>
 <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_073659_406700_05F05709 
X-CRM114-Status: UNSURE (   9.71  )
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

On 7/20/26 15:30, Igor Paunovic wrote:
> Hi Dmitry,
> 
> Great to hear it works on the 5B -- thanks for testing!
> 
> Agreed on the -EBUSY guard, done in my tree exactly as you wrote it.
> It also supersedes the suspend cancel/re-arm I had queued from the
> bot review: with suspend refused while audio_streaming is set, the
> worker can never be armed at suspend time, so those hunks are
> dropped.
> 
> v4 follows shortly with this plus Sebastian's dts restructuring
> (shared disabled-by-default card in rk3588-extra.dtsi, renamed to
> "RK3588 HDMI-IN") and Krzysztof's binding comments (dai-common.yaml
> reference + unevaluatedProperties).

Re-arming will be best option if it works properly.

-- 
Best regards,
Dmitry

