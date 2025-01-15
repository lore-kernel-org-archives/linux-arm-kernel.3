Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96429C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5nuVE6fLIWMYI473a652vd0ocNHHQJa6QX2DBAbAaA=; b=kYny8JmZEJTcXidGuz1gHwN4wI
	3DxfO0/0u23sXwk8ChLF9Z5nP2TPi/Rgj0HCIar9KfJctNM6biG7MshEEpTtQGJrmduCCYUA9wZbP
	33uYvjp5GQOlhcVf/eOWUcm87VKzThEl888W01OqFbbq7BM0B0g00OEtHNPsTxPMcdxwgOuVhVdEV
	CVhEIItSiyZXCk+hoz3yN7xCWJhiKUnsQotCAcMeisadNKodA9YqNZDPoIuoRq+HFE5wlQHRZNEDf
	HggMGO82V28n46omd7QoeuYpzgQJIQcWq8hd1HIiokloL2OVSuR9nvSKdgfe3JsFrs0rByhZUWDXs
	umiw1Ifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0So-0000000BSNt-3UiO;
	Wed, 15 Jan 2025 10:17:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0Ra-0000000BSJD-0Xc4;
	Wed, 15 Jan 2025 10:16:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1736936162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ovbxj/xtTqCAuQp6DlxbglYNJvjMOhuJlYs2xLyXLHK2uiTzqH1gRYvHUTH20eBLdEa6UvXHhOraJZcBstvdKLBtvf0Rh0Up5Ex94wqE+8bGAujtRjVRkHiC1T3w7paQKpbXc8KulYsueqB8HVTPdkSmIPQZ5w3kizRKR4oBjdg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736936162; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=f5nuVE6fLIWMYI473a652vd0ocNHHQJa6QX2DBAbAaA=; 
	b=A2Q8Mx/VyydC2Fr2bzXZLwZJhMYn6QOVBsDmX1Xse4ngMtYtTdCHefqTjebbp9OexcmOJez39uJJ9bMS2yqPJOBwcEyNCag6LdtP9RAdDKZSzVpMhYTYonhWU/BMOqJGUIZSwC9OiOCPegnthdgRpLmBcFnjD2UOq5SA8R7+Peo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736936162;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=f5nuVE6fLIWMYI473a652vd0ocNHHQJa6QX2DBAbAaA=;
	b=j77Z1Cx1mJMylymbPu0FmD1L9Kn4Xrs/fdD00BMDd6rVX3GX17h/3gA+qOFlvvB0
	TN35FMK8+bSL58fzxCUbgDfRr8+1SlaCg5ua1So1tkE9rLfmqpOFz8x/mtAZVLTtT9A
	fLjmzSR/7fxSlVvpZPpa+GShdAaZ77+xQFPaiR6E=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 173693616069360.269632216771925; Wed, 15 Jan 2025 02:16:00 -0800 (PST)
Date: Wed, 15 Jan 2025 11:16:00 +0100
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	"Sean Wang" <sean.wang@mediatek.com>,
	"devicetree" <devicetree@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek" <linux-mediatek@lists.infradead.org>,
	"kernel" <kernel@collabora.com>
Message-ID: <19469767d9c.d70b2edd1099115.3136795565203045474@collabora.com>
In-Reply-To: <20250114-lily-defensive-3383449a7945@spud>
References: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
 <20250114-dts_mt8370-genio-510-v1-1-8517ee0fdbe8@collabora.com>
 <ef8bbe7a-64fa-4e51-86f3-4f7fc0bb3760@collabora.com> <20250114-lily-defensive-3383449a7945@spud>
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: add mt8370-evk board
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_021614_257586_61C21665 
X-CRM114-Status: GOOD (  13.53  )
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

 ---- On Tue, 14 Jan 2025 18:54:54 +0100  Conor Dooley  wrote --- 
 > On Tue, Jan 14, 2025 at 11:32:47AM +0100, AngeloGioacchino Del Regno wrote:
 > > Il 14/01/25 08:38, Louis-Alexis Eyraud ha scritto:
 > > > Add bindings for the MediaTek mt8370-evk board, also known
 > > > as the "Genio 510-EVK".
 > > > 
 > > > Signed-off-by: Louis-Alexis Eyraud louisalexis.eyraud@collabora.com>
 > > 
 > > Reviewed-by: AngeloGioacchino Del Regno angelogioacchino.delregno@collabora.com>
 > 
 > Can either of you explain why there's a fallback here to the mt8188?
 > 

The mt8370 SoC belongs to the same family as the mt8188 and mt8390.

It is a less powerful variant of mt8390, with less A55 and Mali G57 cores as main differences, and like the mt8390, its hardware register maps are identical to mt8188.
That is why I added a fallback on mt8188.

I'll reword the commit message in v2 series to add these details (they were only present in the mt8370.dtsi patch).

Regards,
Louis-Alexis Eyraud

