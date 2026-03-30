Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8B2FF4954
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9l0DICorx9e3YtEUL9sxg4iXIgZ/t1UyQoc1s5iSxOA=; b=xlxSn/QduhaS2YpRLsbbDfGjER
	iAeLB1pnYzQ2FT1hA8Dk/febhfyIZKRV1hP4h9YJG6TNb/4FLd0188K28a1f/iz6D2jiQrn8jngGt
	3ClLgL+6QIAYfpk3pg+z3/EFWnlmKh9wmfbaeLHDvZrBCSu+DYUU2EvwZRExOd2OlPT/Uue7uTuW4
	jg+anQqN3VLk7nkbyW6MJQl7riw3HQY8PRNbKB2NCOarxVuqP71ud1ygdYN/ZX3ZBi3D31Z4s+gj4
	OGGy9tV+7MenGM/Dtg+Ew5xkQoZAbdHqFK9knaoI8agWWDHfGZcXf9qCFKLvLGMHLHe3ZNvjqoNKS
	P7MUENcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76tA-0000000AkXw-2LxO;
	Mon, 30 Mar 2026 07:18:20 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76t7-0000000AkXP-3eQ1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:18:19 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35c238f1063so1958419a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 00:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774855096; x=1775459896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9l0DICorx9e3YtEUL9sxg4iXIgZ/t1UyQoc1s5iSxOA=;
        b=v9qKiz9POKey7UG9/ViOn6CPtEPRtjKhpt+CfQEWVdu3+MlhrCe2G4CufCHvUmpt9v
         XkCkPnG8jWwaqp8hN3JGl9eZBPfz1y9eSL9SDMtvlLnmRXj/4FnYnw7XtsDeGn+cdsNk
         kjX7mWLjbXTnRsMyCwkBGNI5/q0G1OeKdPSjgyGF3fqWUs5KFcAXMj4jtbe1xsl4oEel
         orz1epYqzopsZ7m/HtAOlRKD/aB8Z3ybzUhwNHDQZCztJDssOhL5zWyz5Qx9tJtUdfC6
         eLVR268L8l8gFNZvva1ikO1gTZdAlJ6YjgO59OKsN2sAIcJFamXzjHvg1D9utR1XywSL
         SKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774855096; x=1775459896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9l0DICorx9e3YtEUL9sxg4iXIgZ/t1UyQoc1s5iSxOA=;
        b=ilK8AiZMwqn1Z2Bpk/7K2Zh741iv3/vCabP/mP+wSn6i36PgcacrDNLkWSlSrffzLo
         G2foxF7Xd8g2dRmXkL984gJLzBqdc+v4SSbLhA1iS+1v8YjlN/z32gG3MNlP8rXmQPiq
         BC22vdwlCZssQO8MvSUG3EQFIWb+1v1XV6VzxvaZDK8oFX6Elh35hZRTkkzKmyZMWOXD
         bEeTLbkcdceN8TJ5YXjRHHi/3HRzMenhJiqF7pg7crwVY9J/XikJhibQWAi0KFuq2bXA
         hZ+E3NCxnvjC8MdNS4fUxt1ZU9hebfYxU30S8yVQ8Jv3+lvo+5qDrWWXW7r381TngoYV
         ItsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoJCd1xkVz1HIVLdKEtqA3aCv4aOCwF0JRavlaS59TACTImytOzzQQWWQoZ0ut3Dcv+dP3Q06cHuw0ApZOulE7@lists.infradead.org
X-Gm-Message-State: AOJu0YxZw/Fl/f+e6UD3sLrqPbfcZQeasNB8/lmJzwGZbE423Lf6NFYz
	Mk9iYMtvnUNfO7TSsXkA/RXm0zSU2RCQiOfcRKI7PuLISBBjyUhlMmS2Wsap2AwVkKw=
X-Gm-Gg: ATEYQzwagHTdEXbbW6biX2rMy997euEuTauMk2Nm/WNeSA55InVZW2lDD3fTC92H5yS
	D8hWN7klGXUED4szccj+q69U41zWWh1qr1wYqe1e4lrBcxZn4z4ogvMc2xYP//Lh5S4VsZb1Ds/
	4/T5R9xAF3iH6M+CpVahXeSJ6/aah9QuRXw163M9BhO2Y/ILVQsY/sQJ1fxe1HUfh8sd+7IxsT8
	T2Pd0d9oD3l/XjEKAAmIXApqRXsBLjSq0PThXIDmsekh5B6Pr4i7DUbREJOU+K3bkc8LDYzl1j1
	t2WzDHvHEypxKMh6Z2zvUkuIWRJDByJy3nUt8JYWqJjtuGSablHDa7+CT0GS29zTYUDXYygQLE4
	KMVubiFe4QBPHolxoccVGXYXCPU72Csj5xlrTkH/2AhsjVQeMUqixLkucgKk/sgr3HTP17drXJJ
	IpzKmPtGOxUhBEwgcaei6l3kCq
X-Received: by 2002:a17:90a:d403:b0:35d:a3b4:2f0d with SMTP id 98e67ed59e1d1-35da3b43086mr3290718a91.6.1774855096016;
        Mon, 30 Mar 2026 00:18:16 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baab6sm5415873a12.2.2026.03.30.00.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:18:15 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:48:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH v3 0/2] dt-bindings: thermal: st,thermal-spear1340:
 convert to dtschema
Message-ID: <sepwwys3izddmyokbkwdgqxzta2oceu54u62dj5mif4c2am7ku@vn4ewcicx2vf>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329123449.309814-1-krishnagopi487@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_001817_946892_744CF4D3 
X-CRM114-Status: GOOD (  15.45  )
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

On 29-03-26, 18:04, Gopi Krishna Menon wrote:
> This patch series converts SPEAr Thermal Sensor bindings to DT schema
> and removes the thermal_flags property from spear13xx.dtsi.
> 
> Changes since v2:
> - Reword the commit message and subject to correct explanation in patch 2
> - No changes in patch 1
> Changes since v1:
> - Changed unevaluatedProperties to additionalProperties in the binding
> - Reword the commit message and subject in the second patch
> 
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
> Gopi Krishna Menon (2):
>   dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
>   ARM: dts: st: spear: remove undocumented thermal_flags property
> 
>  .../bindings/thermal/spear-thermal.txt        | 14 --------
>  .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
>  arch/arm/boot/dts/st/spear13xx.dtsi           |  1 -
>  3 files changed, 36 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

