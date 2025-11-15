Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D36CEB2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gm+ckSfEplX4Ke9EThg3ex6u+yrRtxkSfPzMWCL9PGA=; b=MwIrdk/Va9pcVgDvrPde5tBL/J
	bJ2zxd4E2Mtnk7QM3ILUZn8vuV/K54aQzt3bD7GfFTO0EDIDyvcXxo9dOUI+h23cQZbtn2bic9s4F
	+ZZI76v3L9f1/SdCGq2rx+cyUTgt2hptzLydkw0CJl78W/FIPPjEm4jDXwPp72TZ5CgaBdXotvNh2
	4ttKmdIWWVKCwfmv/u0l6T7CqgwJXuXSz9IRh3YOAcWx9bW0cK47xmyutnRZo58WlUfZ++wZXUZWg
	+LjaM6Bqlhn6HvUQ6qcqxKIPkoutJVvLJJB8DU8qAgAdVH10iHEhc3TAJohBQibJT7vwcfRErH8gh
	d7EEoBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKDGM-0000000DhNK-0T0o;
	Sat, 15 Nov 2025 10:12:10 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKDGK-0000000DhMi-0GTa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 10:12:09 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso1711721a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763201527; x=1763806327; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gm+ckSfEplX4Ke9EThg3ex6u+yrRtxkSfPzMWCL9PGA=;
        b=AHlT7QJ9TckMVf1vXIVcO5mr4Ur6r6EIVdMfi9pxPDeA5yQ1+BxExpTc8JTF6Belgv
         RznPnrGXyqEElGdXcrW4Dz+XC7KzRSPxZxqAugqMRihf18kFwkfeX/rqqNlIKTDEkFkJ
         OYaQANcuWtoly5O3u2FSdNvSQsYFMZEPQ08+7bfjnUhrpGoI60cMhyBjV/r12a8fLXat
         nFCm2BiLo5omISg4LlC1AxwUaDoDXOlhq7iZzZIZmDx4eC8hfN2KIG03ty/L7GVPvl3C
         3cenL/cX9d3PPxQge2RDcDc6mBojIoU2EGb4BMlpXlOqsq7omdukym7UEloRCmWpWUwK
         52MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763201527; x=1763806327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gm+ckSfEplX4Ke9EThg3ex6u+yrRtxkSfPzMWCL9PGA=;
        b=OarcpcMFDqZX/EF76TfxTCSG6Eg95hXXjSD1O+RXLbtArGc0CVG4D9mGf9t43VKo/z
         G87cAeg70grqWHfNmWXnhbdDotLX3Ve0N7MiGNCZK3WyL1vpMC8ST+rSEkEF4sPgehnp
         rC2lW8kpUGR2WmyolIKW6rAH5zWARSQR+KC1EtTHc8n02UMeTjQLkAcsCVCYhxCziw5e
         xWP37ZeEQCRVUVZJD0QYGACvZ7cTNTe5oz9u8JvxMCsBeMaql34Z4DnAPFQi4/e+Rwb4
         mwz96cHmoXtP+C6Ecd1/sktI9UU6oyycqosp6BufeCcXU8dFM3puX1H+5uAnqwxiUcav
         1+OA==
X-Forwarded-Encrypted: i=1; AJvYcCUy3r1hgOSMHvVKgWfOxJQ8f69eLR6bikckDQqJ4qtlNd15jb5NDZ3ou4eUV1+XKHSUCpsasxLseoEEhoVyiiB1@lists.infradead.org
X-Gm-Message-State: AOJu0Yylp1uZkJT+qokvoYWaLBv2msKgb+DwO5n009YsjmjXg0vHNE0u
	z/MXvm7URntvH3jaKGGrKUAkMNpAc1MQjynhS3r41G7FHP27WLrWrhgI
X-Gm-Gg: ASbGncuiTQVxewY1oS2tTQEL7aB/8QTWYJCP/AUd+djxlz+eNPAY5queFDR+nU8f5eB
	IJahLhs7qbYot+//YUYLntxJC0P97tPOjux/dtQkSbNbhw+AjItUOh4WlBTin1+Emm0+Rq49Bx7
	+5Ol/mSrawAXHk+YQTko6yeV1IHFFkivevVidOrMU5hn74mxCy7BtQQIHnGYr07xmZf4zkrxOWa
	qT3FZBualgnKegZCUe2Q3n/TtXGxa5VkFs7Qv+QSdRNgd2BP6sfH/MiNgdT6v3SfQkHJlWyfVIT
	KeOD6iA6pJxA4UupWlH7pBpkOMEUKjXorFDF3IS/XnmKejuLspvpWhtKOsQ06oLZJfBtMuxOgsU
	nja5tST7TE9c/s9g7e71m47ZqxRvVn6NBCmYhiaDJMC4NvScMibompfSya0T5Hkh3bRcHrt3NFw
	==
X-Google-Smtp-Source: AGHT+IFOLT76Y53zANSgKQXjUT+7ysvQ4Xrl63BgxDn5v68pWGwdHgGSzDNQOkc+msl09UwqFa5XFw==
X-Received: by 2002:a05:7301:b0d:b0:2a4:3594:d552 with SMTP id 5a478bee46e88-2a4abb23c99mr1792869eec.31.1763201526899;
        Sat, 15 Nov 2025 02:12:06 -0800 (PST)
Received: from geday ([2804:7f2:800b:a121::dead:c001])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49dad0aefsm15522074eec.3.2025.11.15.02.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 02:12:06 -0800 (PST)
Date: Sat, 15 Nov 2025 07:11:59 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH 2/3] PCI: rockchip-host: comment danger of 5.0 GT/s speed
Message-ID: <aRhR79u5BPtRRFw3@geday>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
 <b04ed0deb42c914847dd28233010f9573d6b5902.1763197368.git.geraldogabriel@gmail.com>
 <c8a6d165-2cdd-cd0d-4bed-95dfa5ff30d2@manjaro.org>
 <aRhNIcGcQKp2ylqN@geday>
 <85d1543b-ea91-5f0f-59d6-e00fcf720938@manjaro.org>
 <aRhQMRjffbeCeArE@geday>
 <52931e25-0d6f-ca0a-7c26-2c65ab11432e@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52931e25-0d6f-ca0a-7c26-2c65ab11432e@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_021208_104377_E38A1019 
X-CRM114-Status: UNSURE (   9.32  )
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

On Sat, Nov 15, 2025 at 11:09:42AM +0100, Dragan Simic wrote:
> Please, wait a day or two before sending the v2, because that's
> standard procedure.  Sending more than one version in the same day
> is highly discouraged, because it doesn't give enough time to people
> for reviewing, and may cause people to look at a wrong version.

Yeah, you're right, sorry.

