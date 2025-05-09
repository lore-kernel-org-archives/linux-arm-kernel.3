Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A09C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kAnEBoGfcRxHoefm2a9uEDzuZTjWxkIy4q4u9OHJ+M=; b=a//3CLDdtgFpiHQwu7oUILguJm
	x4AQPq5qYfeme93nnfA6c9uJ8zB83WT+UD1agRQIksBJotioIgxmT9sojPEinmxDXTsr2/zXKqiHu
	fZnJAsBvM+IPU9RkOOzcRctbLnLPPgCGCvVSEUzK9Ex6jQ1bsFXRLmCvk5OXQwiyooOjcs9sR/iWi
	WI8jmRW2I87SLoo67eFUfpWybzynPKBCtYVqoqRIulvdKm2wjIxRY3u6ca5qNrPRr4UXZWljcIB/i
	FRRqxHLTNelWjUuS8SBBSlhgFlakxWn4HeZHLE5qR+BQhECZbWTk3vmJSJQQhMyfxUKV3q4NYblk0
	KczW21wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJm-00000004ogj-1NPo;
	Fri, 09 May 2025 20:27:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDS9u-00000004X2x-39Te;
	Fri, 09 May 2025 18:09:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB545629F6;
	Fri,  9 May 2025 18:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A6BC4CEE4;
	Fri,  9 May 2025 18:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746814157;
	bh=cmje0Gqin1UMwYrEQVfW/u3H9mdsF20Jozm64dt9YDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Am4m4k/s/uSA+9iHikVl3vssi2y3uBjthLsNORupTj8CpJx4R8d2XbA1rdooSBpIH
	 11Q02LEfmtKlE0P5UJUZuype0h1P/jK9rRg8fC7v/1uHiLcvfI2YeZ3rP3rwWHAeNd
	 idg6a26cCvSWHcIVO2eVLYZx29cEickdDmQDWezJaknApzvNAsxme2jtXRqrqL8yQd
	 0c8YsLfr3JMSgQFDSRfIo3Oqj1uUc3crl9PRuuMYaKy9H2eWKx9lZYPKdCcv9E4lGS
	 aSm9HUjEE3I2KYYgjebF9mOV5Od2ULi4ngH200yQT8t1x4qzOMuZVTr0Y+jrHCxFkd
	 4YtENvW0P6COg==
Date: Fri, 9 May 2025 13:09:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>, Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 05/13] ASoC: dt-bindings: mt8192-afe-pcm: Allow
 specifying reserved memory region
Message-ID: <174681415530.3876555.5160678199255318947.robh@kernel.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
 <20250424102509.1083185-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424102509.1083185-6-wenst@chromium.org>
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


On Thu, 24 Apr 2025 18:24:59 +0800, Chen-Yu Tsai wrote:
> It is desirable to reserve memory for the audio frontend.
> 
> Allow the "memory-region" property, to be used to point to a reserved
> memory region.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


