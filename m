Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EA7D2E022
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+QeIILK7+sXfrLD9FRKT9V9VJhexKPV5C9ZSlyiv6A=; b=pzgDYde8e32mK1Gq1S5VS+MJz7
	vo9Bv6TJkQhygAEUGb6wMgXZT20hYJFTL+lDGAfy7BUnYuzNyrFr3ggG6J0S3yyNJhow0pxTNkNJf
	FzNvluGAsJ5Gr3gATwdxQ3n5yT4N7EA0U/tV4ao5lpm3bCaIzuBNPMK7QOnqK46e7T1Cv8gFp2WYC
	PIDDKYPlrNXnwjrLwcMyn4L+C53iwnUCnKW3vXZ9C8sQJBLO7YXXdyZZboN+99rBNOwYEkgfZIVdt
	beRsGOMZ2dhm5y/2T1aXd0FcCrjbDDvz1O9rp6GFjRn0SNLtmbNgh2HiaPqbrdQUJJEr85rlKKxs0
	bcHw3kHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WrN-0000000Db2l-0jTL;
	Wed, 23 Oct 2024 08:36:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wl6-0000000DZRb-1QQ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20541A44BB9;
	Wed, 23 Oct 2024 08:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52ECCC4CEC7;
	Wed, 23 Oct 2024 08:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729672222;
	bh=7mytYLN2WfdWcKkA/4BcRfwkzwaK4SyKL36rOzjrNlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyR0e0jR2hqQpRjANY8apMmNsmPZ/ycB6uRKon6dGd3XMV5OReKFu7crmnCHm+BLK
	 bW9rmncgNZYclgpNFlbE1RAeyt8CP1hPLaALY5brtc+DeR+fzrMTchCoqhG4A+Kfn/
	 XieFgZIdnFH/YBjb0yWVdASNHoUez24NcoWZZYKNYQ0zDMJVA0cEE96X2qat0FVYKx
	 aKvwA0wPec7bB6y/ja0rxgq6zarVY/0r4FLUiafIakL/qxzTqyCRO+sd+1HFuStl/Z
	 ua3fkej6bIAwFhmzh7JVD+eEz/ij5Y9ES8zmLDQNFD7qrGgXVpIVGtHP1Coqjdi0ni
	 rkYIbnMoxxgGQ==
Date: Wed, 23 Oct 2024 10:30:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH 2/5] dt-bindings: mfd: qcom,spmi-pmic: Document PMICs
 added in SM8750
Message-ID: <jcrtuqrj7loexcburucrneptvmzyqm6sbu6o27lwtftt3kc43c@ggd4sgfzmtvl>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-3-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021232114.2636083-3-quic_molvera@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_013024_459353_5EAAB03E 
X-CRM114-Status: UNSURE (   9.67  )
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

On Mon, Oct 21, 2024 at 04:21:11PM -0700, Melody Olvera wrote:
> From: Jishnu Prakash <quic_jprakash@quicinc.com>
> 
> Document compatibles for the added pmd8028 and pmih0108 SPMI PMICs.
> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


