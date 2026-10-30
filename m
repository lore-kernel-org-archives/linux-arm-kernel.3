Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420C3606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZjKjPXE2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYPcu94u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XCiNX/JVOGez8Xk/1UsypK/8unagw3ySEZpGAE4b/PU=; b=ZjKjPXE2BSsf5PWO6gqBuRF8Hq
	CaLdkZLWTHy1f2gsyYAKWchxjO4TB9shvQ7If0YxNyTrS2YdDqcLV7IPacnwWJgo3bFrBIMCjvJHV
	FmPwLvvb9N8Q9HTJAbhjLO/5akz9LFdsyzsBHnOytbFpUFO5SUMd5jVFg3izBVtoeyxaKR5acF2Oj
	86V7+55hwyj9ZYUFquS8l9OM0Mna7UmqjqbTVkYX7faUEnyGnyPU92MKs9erfsdeOb/zOSxYs2+mC
	EwI8A90SgyNSA8nrgh9FEuH9AHSdiWMyjBUaosA8A0/tLoClcW1M8nJFmaYScfkik3VSPYh4hHn2g
	l4P2igCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMofm-0000000C1VS-1Tis;
	Fri, 30 Oct 2026 15:37:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMofk-0000000C1VG-3lgY;
	Fri, 30 Oct 2026 15:37:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7571601F8;
	Fri, 30 Oct 2026 15:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F343C1F000C1;
	Fri, 30 Oct 2026 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793374659;
	bh=XCiNX/JVOGez8Xk/1UsypK/8unagw3ySEZpGAE4b/PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eYPcu94uQR0iroKxabErt/vMeQpkS6GHmYqkY6K/hsBKExvogGDA5qavalpX7diso
	 sEnExCJ6pL+aMhcXQa9nOCRjMYYsmKIewRxzvQ/IFjkL95xYA5b3zwoQbzVWaKOOwI
	 o6B6V434EhSr6JrU93kVp62Ys3bkTc0bZyOICc97qraH8Yr4EDwiiiQ47Nbzu/GcKS
	 tQaNC5Oj8/Hl+RLjGwomsKH0cx8OXnUO7d3HGHazFoYCgzDMengZVnDPHYj5uhY4up
	 L9HAZAdpfbdd0huC7ZIv/ptlAi//Cx8KKSZPij6Xy9JqY3f/pSEXT6lNiHBz8ozRSr
	 ePvc9SbJzrMHg==
Date: Fri, 30 Oct 2026 10:37:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-msm@vger.kernel.org, kernel@collabora.com,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add DP AltMode VDO
 definitions
Message-ID: <179337465400.84888.3742821306180062985.robh@kernel.org>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-1-7ab3d93553dd@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-1-7ab3d93553dd@collabora.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 17 Oct 2026 21:59:30 +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The typical USB-C DisplayPort AltMode capabilities for a down facing
> port (i.e. sending out video data) looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <0xff01>;
> 		vdo = <0x00001c46>;
> 	};
> };
> 
> Improve the readability by adding defines for the numbers, so that
> the above instead looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> 		vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> 			      DP_CAP_UHBR_13_5_UNSUPPORTED,
> 			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> 			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> 			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> 	};
> };
> 
> The generated DT binary will stay unchanged.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  include/dt-bindings/usb/pd.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


