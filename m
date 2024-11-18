Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0085AD4920C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXaBGWR07f8ge1xeXOPSaCwmqO/Cy55m2joFSOl39so=; b=NAeAsXaQkn7eerVptoF88a+plx
	DjLprAEcB9lUsmzF4sLxXUMeDUKS81ne3+XgyqCk2+RiwugDFXrj1z+CNedG3PSvDymXNvHTPWzJo
	t1pM1XUtdMKFy06t5kZ4DlrzpIA8WYoseK+piL/cvGsDOUE4jEnwVzN7Pwr2+Xp4n6pb+F4TKJSsP
	zRO7//G9c2+QBKcOGMra2QOrSBhMmXTSBzWc0EmQEjbFN2/aZ9+kgyEnB4RiRIw0spCPyQVIad+x0
	N+Qqh3Z6XW0gJUoind+fZt/4RAkva2eiGvmAn+tLRj9iuIsSkauSVH1ZtAI0wm0vansfAkCA+ZhAk
	CSABV2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzTv-00000009B3C-2qMe;
	Mon, 18 Nov 2024 10:59:47 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzSw-00000009AtY-1ZjF;
	Mon, 18 Nov 2024 10:58:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76B85C0003;
	Mon, 18 Nov 2024 10:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731927523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXaBGWR07f8ge1xeXOPSaCwmqO/Cy55m2joFSOl39so=;
	b=L39MPsC6OBLQl/5e2f5dKe8qyENmtiOV8QJ2P0a1KGnnpJEZd1tCO2Dpp6gVQp6rt1glHD
	EZp6o0PFivl3D9sH+U6jJ/JC/3kEQ9gMDpI1FL2NqEN77B9G3uJza5UsgNnAIgrdr3ot44
	c2/gZEykQAqW90ng1vfJeoCEigS2SyDTqgCLnCGATHB40NvnJQ9Q+o4BQNGiEpMpwPs+i2
	GfSMNEX0JajxgPc3Nq0xtPB5sJfoOKmVAxN+glAyCyP9wuJOzVZBlxCbd3WuiP2mXPrMIC
	ZzAEYoYzP7rp4if1qJtD3bffKew0/9/BFapB4zIMMnaHVVrhhlRmnwwSA5TLQQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  Mika
 Westerberg <mika.westerberg@linux.intel.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  Steven Liu
 <Steven.Liu@mediatek.com>
Subject: Re: [RFC PATCH nand/next 2/4] include: mtd: Add CASN page
 definition and related structs.
In-Reply-To: <20241020132722.20565-3-SkyLake.Huang@mediatek.com> (Sky Huang's
	message of "Sun, 20 Oct 2024 21:27:20 +0800")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
	<20241020132722.20565-3-SkyLake.Huang@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 11:58:39 +0100
Message-ID: <8734jozu3k.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_025846_538968_FD99AF62 
X-CRM114-Status: UNSURE (   6.76  )
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

On 20/10/2024 at 21:27:20 +08, Sky Huang <SkyLake.Huang@mediatek.com> wrote:

> From: "Sky Huang" <skylake.huang@mediatek.com>
>
> This patch adds CASN page definition. You can see corresponding
> table in CASN page application note referred in cover letter.
> (https://github.com/mtk-openwrt/doc/blob/
> main/CASN%20Page%20Introduction.pdf)

Please don't break URLs. They become no longer clickable.

>
> +
> +struct SPINAND_FLAGS {

No upper case struct type please.

Thanks,
Miqu=C3=A8l

