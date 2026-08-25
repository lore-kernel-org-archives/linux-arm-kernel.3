Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DB4C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 15:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbsG+1QcQGpn/6wkJpy4eTwTvVz7cjdJk+5+NrHiCj0=; b=I8uu3Wp005sPOGx6Ebj+tPN1uI
	bz/Vlri3M12zIbelzVuQvJEydWa1HjWWyvCl1h3DL1ekBVzgUx+oBaowH366VtXALwGLq3I+llAnG
	fRHZDgIVo12O5J3WacwSrqCupZ8oVtRWt1d8aWWYsLOS5zN0/t2zwreg2h2fe9DtpNqtDL2zzFElv
	q+tGoG9cPzEsKMgd0u8CrW7qon3UvPE24CI6WwbdKY6pzV6L3B5KQhy5ripz7EF+zl31lV94hJjru
	/+Nzsl0B4enQo1daZE7hnICgowhjjssCRarsG6sMvhRWx47qSkFrtlxhIHCCankOWUj9f3l/MZC+u
	F072krRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytPs-000000013ks-0F46;
	Tue, 25 Aug 2026 15:50:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wytPp-000000013kG-3uyM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 15:50:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-482e1e7aa20so104823f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 08:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787673019; x=1788277819; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lbsG+1QcQGpn/6wkJpy4eTwTvVz7cjdJk+5+NrHiCj0=;
        b=yiLqYZWux3K4Hha6J4aEz3xGR7pOIJLxKDkruI4Yt/4E/mW5fzSzw9TElKnfWBI39v
         xBg3Y6AEQIech9tISAwlr30LuFvurchLrMLq3xkm3IHaFc6l3dJS8ThiPLO5vPz7xqTz
         RjdGjRNV9XBZ+1q6v4N9NkrqSqrlZBCq2Rysow0TiHkUN/rCxNd2Y5NWAweqjIharMRl
         euLMR1QQcAjNwmY3vJzU44AC97w0KjQcHlCaXcTiqYdxMyHjpm9IOcJhaqGRjpuJntTL
         aF7qBRMa41Dtlzine+vtTJmyHcJCWlXdlVOliWvnfOY+ag7eY2LJs7klGMteJj/T7T4e
         zx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787673019; x=1788277819;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbsG+1QcQGpn/6wkJpy4eTwTvVz7cjdJk+5+NrHiCj0=;
        b=Cu9rw/wexeTRtOwWOTHCD5cmnelrLHDMh/5w7Xgh6EEdciJG3qCBTCfR+Ze3puibbd
         W8ZjytZLGWlGnbrTFlsPoNL1E2HtIIPomQn2LaIoywkpzDB2t2rph81ULu0RLPHfhm0j
         ZS3UZJPj/JRDuq8F8mfOOhPUVoxK4W4TJVo4mtUienimi2VIlt1x6mqz1mYJ9OsUqfoH
         yNlmxARYDQ338U6ROfR8C2Z7kIkATx4FgXxCKUIItSNXM7Iz4vHujUY9ysdGSKbKcORn
         dQqyg51N+E1RzkwbAd6+ZuDdK6KO/Z04+XPhq/xci4qMr4XNGueQrr/GVxZetrb4pSHT
         fe7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrZS3aa2iIyKkDvCjXh1CW2He/P884JsQKoHpkfv1F68TUXCnnkFqWCy+U7E1On5rJiUXvbjldheLIUmOwZV7oe@lists.infradead.org
X-Gm-Message-State: AFuF++l/5yqZ3RmoQvl850vvFpjorSdxyfP6OWSQW8WigC3FvCMBqwdO
	KZLuw2r4yzJockw/rzYao0dRpEn7d8RR7q0zIqGlOA2zWlOb0DtoF7B1QXcLt62QL2k=
X-Gm-Gg: AR+sD12j6PTSyBmjiZ6PCC2zFMuZ3r+I3+rnj1f9GjWW+IdMFBEBNn2DjrfJKfrPuNy
	F6oTi0YGHgx2XuPhe1GWL3eGlnTaVVhP/Q0S9U4sMsvyae0HgdpB4WhbdN1ianNO6NawBk033dc
	bJreXB8rkpcW3wbBTaUZGIwyRzBYyj5OldDJDmdW27oioMGaWUzndAIJypxVzQow32iwZNOg/K/
	j9B5/B84K7rB8nItpQScf+OSODeIg2ORBb/ZMZT0pspT42HUOyf6eM/0pFnH62UQZsnvRdT19hl
	Lid41xqzmFF/1XfMWjRKfu92Q/mT7GNGmDH4oI5B0fY3nVywXMVTHG6XNjO0sfMEqYlx8NngINZ
	ClREmwYYeMYWxNn8dGr08qLyzdRv6BNuous3D+5A5DzjSfhu5sx/SNu/jkviGucqLfzSGi2mw6K
	P+DXq+pyBM2+XPDPzrtyAOo+lMCHHVRRIe7RTPQNi9ltbMbkYET4lJ2Ly/CglFtiS5Zsq1ZMMAz
	cn8LBCTf4dGBGtGdd+gH5qZeuf1iouVrWcVXU6Xi8qRvtDTUCv0CgwUGbgi
X-Received: by 2002:a05:6000:4685:b0:47f:8ac0:ccb4 with SMTP id ffacd0b85a97d-482e26d9adbmr43120f8f.10.1787673019285;
        Tue, 25 Aug 2026 08:50:19 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482dd853b9asm1999374f8f.1.2026.08.25.08.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 08:50:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 16:50:17 +0100
Message-Id: <DKY572QGTWSQ.3GW5FQV7JF485@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Thomas Turner" <tturner@lineageos.org>
Cc: <krzysztof.kozlowski@oss.qualcomm.com>, <semen.protsenko@linaro.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <peter.griffin@linaro.org>, <alim.akhtar@samsung.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Exynos850 GPU support
X-Mailer: aerc 0.21.0
References: <GVYP280MB12139AB976CA7ACF49FEB768A1A52@GVYP280MB1213.SWEP280.PROD.OUTLOOK.COM> <20260820142330.84514-1-tturner@lineageos.org>
In-Reply-To: <20260820142330.84514-1-tturner@lineageos.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_085021_992628_CD0D5C89 
X-CRM114-Status: GOOD (  10.75  )
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

On Thu Aug 20, 2026 at 3:23 PM BST, Thomas Turner wrote:
> Hi all,

Hi Thomas,

On the next submission, could you please also add my email
alexey.klimov@linaro.org to c/c list?
It is interesting topic.

Offtopic: I have working patches that enable cpu idle states on Exynos850
but they are not upstreameable due to PSCI (needs some argument
shift in one of the PSCI calls due to messed up MPIDRs).
If you will be interested to test/use that, please let me know.

> This is my first time sending patches to linux so apologies for
> mistakes. This series provides basic GPU support to the Exynos850
> platform, making use of the Mali G52 GPU through the panfrost driver.

Best regards,
Alexey

