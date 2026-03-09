Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E5DF41807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcTW7+6Cg2+gxZdrQfqfkBSqoWwEQDXBlUTitYt0Mio=; b=jnkuy+v/BBI30s+fIal9VDjlue
	jgXV8uCw86kUNKDRfWhAE3xStImMBoYi7jnZxw4akSP6fk9DTeOD78/OkCPWAQ32FHEoFNHeWdGFs
	u3Q408h37GXmk17r57l51VsLPzjRz22LEvvdVyM0UwWebD7UkyHyiACdnU7sSz9gCzmUhWSfGxMFV
	RzIWZ6fRzWGzzj/o3O8HLv2LUrgfYAr2oTpILailkd2EqxervXAfd/QD3JasES9nqOziw0HFYGjq4
	ZIr1ErwHvEaRcNbMHwTi7fCDeC3ujwWk7eaZDRsv0czq9rA8GzzPlAeb7SPKWgVitOmuJm/yje2z6
	dg9ENgEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcme-00000007dLk-40xt;
	Mon, 09 Mar 2026 15:44:40 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcmb-00000007dJi-3xcO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:44:39 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48371104ffdso15402625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773071076; x=1773675876; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcTW7+6Cg2+gxZdrQfqfkBSqoWwEQDXBlUTitYt0Mio=;
        b=BD98Y2lOpXgX2PE5DwfTI8TfJjXNDzAxHOdPxLsJq4s/F1H3cSojwpq0CyDTFwE0C3
         FUYtN1kU1pG9Shaw4cYn/fhIOTM22/uci6uT+H5QaPzzP11F42B3XsHV/NIEoxNJ1pHO
         tDYQXy88/GyNLomtPNXNNHm0vJBLQXEtaE2Tt+rojedWasP3hZ/ms8da7ajNuwxdNbNK
         kjZmjl3iGZvLWsTylUsg6UgUwR/SVqr4M8TNg4zK0Pz4q1Uroygdf+z1mup4nrh+86bd
         qCPqd+3dQ4JlvofUYUyW7qww1eEmaob/5hs163amBVuiht/0WF8N6sryLX2ojetPBmnD
         jlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071076; x=1773675876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcTW7+6Cg2+gxZdrQfqfkBSqoWwEQDXBlUTitYt0Mio=;
        b=K9AKlXn8HWJPpC/0J/GKQY0cvJFDW1+p1UJKQbwEs/t0A/ehCm510z2smo6KoWbpmd
         /8YBepXoDAMeDhubx4EaVJzl4xYfTGWhdh3NkIHW56b8BRo8JO/NsznD8i3sRhhyxJfh
         QO+dyJ8BrWOD9lXQfT5jI08hASczM3mzCiN0EpKUVHqgibxgRhoB1BjPkPc7uNPGIh7J
         1/+5MsEZnpBiJDTeDgOElPFWDuq2y7Lbls8SK6cwpMqGgPIW0mW+7yxkm+8LQpR602Jt
         mzCufPJa5LxRH9jNExbKbCCcZpUzoZZBmfDj4jWNhRAI/EWhjzZYbr6bd5eVdTDtgOF5
         Z4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWGv8A5+PT2LXPIOJRhtQSjGddCBXrxRVYT4l1vn668NnEt2XlbAP6tykOeqyGa625EpNyPqvWD0E6Baifm9AnW@lists.infradead.org
X-Gm-Message-State: AOJu0YxMj1SEOsYrYmY7lfKJnJEPI3a94wy/S/S2Z6dfoxLKIr27zhCQ
	K8zdKR0S0fcrSKxxQkH3pid1hGxmhRGfusU6dCmVUv9HQBydiDfFjpgB
X-Gm-Gg: ATEYQzzAWlTqbCc+IODqKTbqzMi0wCKPLCnkkdUxQ2RwaOb80+z9DIPXzlxNsP4YWkl
	etTURymS1JHfVxfN0yAV96S8Wa+4p6fT04ycoEzScisdXaM9xgpQc0t1NwNVzyjr32CVqfNYFhX
	sjBT2Pe1fHaCvLUs/pwjlXjTPVWtiYnQ3Is/PxIZhEuW07/JDGEi8Y/FHNNuKZUiQkYsHDCX8qd
	ysDXsiOgX8OcvschR3+oQfcK+3Q4692KB6jDTAMQNwHlJEs/epB/ROgszLs/92t3oYxq+tVFsIt
	zpg/U8INKKKy4v/axMYc+RLbNgM5qDiEB1Qj/OuujDZx9apPQWiL//tcoRARSfzkyaqaTLV7SUx
	6OdMfClNVPkC33eD2b6ZumKsturo2tvC4MwGESxRSNiw2Eb5OXwg9IQTz1GJw4zM1bkasNBdEmq
	vCZ77bSqC5qzwoZA==
X-Received: by 2002:a05:600c:c4a2:b0:471:ab1:18f5 with SMTP id 5b1f17b1804b1-48526978618mr112712015e9.7.1773071075458;
        Mon, 09 Mar 2026 08:44:35 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d00a:e00:8799:3a7d:3c86:3200])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a6bbcesm439845e9.3.2026.03.09.08.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:44:34 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:44:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260309154432.b3dbantow3e3tkry@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <aaRBjWhP4-7Kru9D@shell.armlinux.org.uk>
 <20260302155736.1fd2980e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302155736.1fd2980e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_084437_993167_5F8BDF97 
X-CRM114-Status: GOOD (  13.10  )
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

On Mon, Mar 02, 2026 at 03:57:36PM -0800, Jakub Kicinski wrote:
> Alright, I think the best we can do here is to merge patch 2 
> in a "stable tag" way. The rest will have to go via net-next.
> 
> I applied patch 2, Russell please rebase the rest on net-next 
> and repost. Patch 2 should disappear. I don't want to merge it
> now as is without an explicit nod from Vinod. He did ask for 
> a tag and we won't provide one.
> 
> Vinod / Vladimir, to merge the "stable tag" of patch 2:
> 
> tag_name=phy-qcom-sgmii-eth-add-set_mode-and-validate-methods
> git fetch https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> git tag $tag_name 0e8147f4da00
> git merge $tag_name
> git tag -d $tag_name
> 
> I think this should work.

Thanks for the anonymous tag. I think you mean sha1sum
4ff5801f45b494ad8251a16ec06c9f303ed3b9a0, not 0e8147f4da00.

