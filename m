Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940D5C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8shiV2SIGvsW4Z77wfkc0qYFz0BxMMmYW6MQexAa7WM=; b=VbsW4EPAaXJNvUbCRHuFmEX8oY
	MZH638yKXBWQvWQ9xD8gbNoKBZLpa5N8mdLQVFT9FZ50TxbNwalK6UTgf97WZbLqfvz7VD+Foub9H
	8Q54CdYB8XXwsrbszB+9QMNP+qGSfEyCM4UAA/Vv9cEQbDbVQwvNHeYUZzaIcaEPJ83m4b+s3hdaS
	boFrCXCbbT+5GQNLChaI3WLMkgbpShOkbaG5wi41teDa3/5wild7vhY5tKKWOONthwceQRpjAZdKI
	iJVXmXtzx90j9KX2pIHwRO1Wj/JyCVkewzaS8I+tDCplUXtxP5HUMY/XCXWA25AJ/tksWzEoRabEx
	arexsq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnj9-00000002qxy-1GfR;
	Mon, 07 Jul 2025 15:25:55 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnaH-00000002pYO-483z;
	Mon, 07 Jul 2025 15:16:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751901394; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iVRQ3Lj2nQGEodePe3GMWxLb1rOtAzDtjebSjaDHNQK50PlibNfw/V8hKbG85AxFlV/Cx7ZRY3RzXJMhOQ+8kQt2uqaEckpOHXq8aWKZM6jCXehtrGAe5CSuFd69QyvPlqqpMxvsO+0e5ECFDhwFwWitinW00N8S6kqpWCjPQtE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751901394; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8shiV2SIGvsW4Z77wfkc0qYFz0BxMMmYW6MQexAa7WM=; 
	b=Z7LwoWzPK0pH+GPWgEool1Hl8FpuFKvCuxAe7mEZJ698nuQDeiK/8DLemUgu8WDo+fOp3tKpb5epOxeMapkaZ6lQD8Ss6/qrs+a/CocOBSsW8L9PJUkrCdwoeG6T54WuPzMOdSvUKgemGLsw0PTmEW0rJlQErwzdZ8bVCpZpjF4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751901394;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=8shiV2SIGvsW4Z77wfkc0qYFz0BxMMmYW6MQexAa7WM=;
	b=G6uDGGGEueurk8Z0HKEKWQrynUTviepXnHnSGHaGvjENKBBi0tFqharDThrkZ1Jm
	vWb51Ymc3t3uCGSq5B0mK4htPs+IkbmdduhLawXrIvqJztGquuefpHPrt75LG0bMo+K
	RWYa6WmxMgcEXSHgjJ8opoksvbHmgEAhIi81MB0o=
Received: by mx.zohomail.com with SMTPS id 1751901391054951.8771545064749;
	Mon, 7 Jul 2025 08:16:31 -0700 (PDT)
Message-ID: <2eb94b4390d7ce859b2e16f9b6abcb075776ca78.camel@collabora.com>
Subject: Re: [PATCH] arm64: defconfig: enable XSPHY driver
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Catalin Marinas
	 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-mediatek@lists.infradead.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 07 Jul 2025 11:16:25 -0400
In-Reply-To: <20250707-mtk-defconfig-usb-phy-v1-1-4a5dd0d26402@collabora.com>
References: <20250707-mtk-defconfig-usb-phy-v1-1-4a5dd0d26402@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_081646_103093_1575E502 
X-CRM114-Status: UNSURE (   8.06  )
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

On Mon, 2025-07-07 at 16:28 +0200, Nicolas Frattaroli wrote:
> The mediatek XSPHY driver is required on mt8196 for working USB
> support.
> Enable it in the defconfig.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas

