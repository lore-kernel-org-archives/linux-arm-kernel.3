Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A5FC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 03:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=; b=DCfrfTwfn63HQaVpoo5pePNVht
	2WVcZZ3b5MIQZj73taLvVuWZzIVKZw3hZs3VzpzqSfm2PjaRCrUPszO/YE0xX+Qpu7GR77w0VprJu
	shAcGOtAAccCzaX8SH3pCCnx45T1fKaDk22ASkPBqG349Ra72auPrL3f+bHrUcXRHMTG8EzxTVa58
	xa/Elyd1OFk7SrKBAFdE5BeJIzHWGXvkIpeR/ndp7wSMRKw6ES/p/a3XwB8ZRXtkC2dvteiaYyTlZ
	RL1x3cbKPiaGoRBj4nzl+ss2h/CymL9yzSggnHZ+21FtTQddH5e5orl5BXQ1/i/cLpsBgJXNUIbp5
	MFwkfgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4s4e-0000000Fmf0-40e4;
	Fri, 11 Sep 2026 03:37:12 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4s4c-0000000Fmec-2zPS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 03:37:11 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso430202a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 20:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789097830; x=1789702630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=;
        b=Rld/lQVb/irJlh3tEp4hcc6hAzCAHiuTb+3JRDO/0anJI8KUV3OMDeBL7K/JyO715V
         sDnXCR+sPsKjbhTLuJdh4KycOocU8Futdn1iSlnODW7SVVRhckvoHwD8xeTMBHb05i2A
         thOF8jsCgiT989C+4T/sQ+JRJ05SUykSpinev8tlrH7xNcKW+hXICszwmHV+0Q4HkowC
         8kTJRfaRf2bs0x19CAVeDJ1DH/gelD62K5FRo5VocpkfsSOEXxkHpmcAqqgkgRDmQtBY
         HANvWr9XbROmzBSWRlR8vi7cnydOODk6bsj53YQt/aKrMSWwZjetLvhRMCGmJd+sroYB
         Asow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789097830; x=1789702630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTrVSBkVGPXm2gcTE8fmlqXbs+T/1ViJad0b75wnA3w=;
        b=SfImBG44eGqY1cqtW1//BKOGvsI9ba0Mj+MaOYQfZylE5cwMivaqJfc1gAkpeFBwqi
         CF1ubrSkFKokfu35rXxB9b4NPicuN1gSmP3lCnV7p7xh+k/vyQYot+FtM8hbG4LTrCnm
         xgb2mJGejbDdsyAu4L5yV8IMygE3xoyOEd0RWCVX1IV4HFhz6OXDdBCltSrKuqGZkDP1
         zyFbCg/0sPQWMmky+F97w0DIwjySWwnbValgT1z5Ad2XHIQc4BW/J5BR0D4RB7ssOHSB
         VANkMuALLdokIdUa2wuAG7qkImCN5VWGhAvoVibwihjQ9rDV+AYjKsOEXOQO8NiiRK4Y
         by1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxAw5ZOlHxb36Hah/LqeR4iqJ80T5jM2zzw48yZfAx5UKik0YKTIIk2jeyyclp3cuuyl5gd1eW19A4yDCmk1AwN@lists.infradead.org
X-Gm-Message-State: AFuF++mdpHUVGLHvwSNkI7tVguhLlFR05BA6kGANL+Xh5B2WZDatvl0K
	0BeLxVW/S+aD8deLq10qEzBzfN4Bx3fcq/SYOMReUXsGz+ctnvJCe85w
X-Gm-Gg: AYBFou2NJvOKD0QQkYla/hySmOF22zBhrTYDHFlTWDYNNtqodCcnTDRcT8wf9P2TNg0
	b8imoZlaGfYqk21cgnj5JgFBtMjXPT5TguHpqHcth/jElTgwUHBcFZsV8cbF5Sf3SIfl/s94rdY
	aQAOb+3bJnRlQ2Ck6NxerAq3FcQkJ5LK/uTS+/EpuLKj2JX0ViwZGaEILXMD+ZAiM/otri2/leF
	pX9SrBJRgmbczMeCZ6rpX/A038obKreKCsmWTPp+1QY+r2flB8P2gveNNBAYl4xZGgx4fNJxldw
	YZzSUOrQJm5mVdZ4WCJLAT7iRbqE8kD98NEUM+fE+lpw0p6DKaajtWjIgCXGcQMLIXDrdytEBsj
	gFJYYCPt3tsjTFX98bLJdL/wqNGMlkMUCjxkA/TSvciuYLffH8jEsoaawEAUZFgN8CLUBGv4/zB
	r2IV8sukHxO0QBVACfITD1U/Z9PY096iPQCZ/jBYOTB5WBU0XeMyiAG1aHLWIrDYy7k718r79DG
	No3slTyqOam+u5A1p2qHOY=
X-Received: by 2002:a17:90b:384f:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39d9c1c016bmr3307088a91.12.1789097829777;
        Thu, 10 Sep 2026 20:37:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95713602sm2537488a91.11.2026.09.10.20.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:37:09 -0700 (PDT)
Date: Thu, 10 Sep 2026 20:37:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zakariya Hadrami <zkh@mailbox.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org, zkh1@proton.me,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: watchdog: mediatek: Add MT8127
Message-ID: <8bd4787a-1666-4f92-960f-287bc3b918a6@roeck-us.net>
References: <20260910-mt8127-amazon-ford-basic-v5-0-3cb9eeaffd5c@mailbox.org>
 <20260910-mt8127-amazon-ford-basic-v5-1-3cb9eeaffd5c@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-mt8127-amazon-ford-basic-v5-1-3cb9eeaffd5c@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_203710_752543_8F1EEB41 
X-CRM114-Status: UNSURE (   9.94  )
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

On Thu, Sep 10, 2026 at 03:29:12PM +0200, Zakariya Hadrami wrote:
> From: Zakariya Hadrami <zkh@mailbox.org>
> 
> Add entry for MT8127 SoC's watchdog which is compatible with MT6589's
> one.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>

Applied.

Thanks,
Guenter

