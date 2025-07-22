Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98859C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 05:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUf4AlEkQu4akq53baJqj49MOp0hPw1pbtMFQqaD0kY=; b=vyPiYj+yOh8JGiTopdWoY2hQ4s
	kHg//TUW1xUISkVVGofTMmJA3QbhmCluiTTKZwiLux3HfvT2tD5yeuMuXXOesscCAGtYDmV8Fge1L
	NHx15VmjpxeiGWG+3Bt1teNsxPezKa/9mVSu9xys9w+f4thpWBzL2HTTELCn1tpuhzZNV6y+ySrfb
	lg4/yp5v6Rht7A95ZaxreHj/4KimwcfgUwY6pghW/XO/Yj5l+V1/RY79Z6v1Z3QnctwgqfhRL2k16
	H0azjrs7WT8BVGMS19rSUpGG+S9hcPxTo6gz91/l7i5BuD0mfJXiI9UN/V7DAnJyY/l11yRI7dbvy
	k0hiHffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5BX-00000001JCu-3xjv;
	Tue, 22 Jul 2025 05:05:04 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue55I-00000001IQq-2CS8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 04:58:38 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so47897071fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 21:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753160314; x=1753765114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUf4AlEkQu4akq53baJqj49MOp0hPw1pbtMFQqaD0kY=;
        b=GXBXFaHKm6yWVxjEpPRcRIa7uKxr2B0apwmYF/5hgOpjuaXaln+77aiZWVPU+GXV39
         D4B8pxEgVgjbkC9BR6g4Al74MVGYmZ67c5sbeDI1ZkV2sUBHxCpRB2c1d/Wa1TdXB2KX
         ojjX6y7CQ0hkyby/Ck0rIGED9uQmFD2tDbVu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753160314; x=1753765114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUf4AlEkQu4akq53baJqj49MOp0hPw1pbtMFQqaD0kY=;
        b=BDx5/T/I6HhSXyeTYglXckcMJ0w7r0+GJ4OXQA76l44MxRl1SIfW3J3jU/FIsm0sKm
         qFmk7O2/b+uj2RvElGz/osufAXdUkELZa83H+0jtT4glI3QY4nKJIOEELs6xeSQy/fkL
         kpnBDG3nRr7xnwSQQzCgrb5lw/p5vSWrY7ylkABMl6Ba62n5Pn+wMJ+yPbtQbg7nEDGv
         dL7mZbpQZhNuFq2LWPy5WQBwFZbXJNQQ47T7vjGD/KqIix3XY1Q65FZ6psyqP1CtywUD
         Li8vErFns9gsCCwAfT/6w3Fpaz+JDBTYNLLqs+Cp8kd7gG+WHnLid62nmr+H30u/tp77
         0bqg==
X-Forwarded-Encrypted: i=1; AJvYcCWNMvxyz9v16gfTDPnYymnHsRUqO7WymreaEVU1IZIs9xyz1usu8z5K/ffwKwfqyV/JjkqYmsPuBLTzgXm2vC8q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw77v1s8RzwggtGDKGTfgvc/M7Yl0/48EegHq26HGC+r7hGXsyD
	EgnBx9JnpVI9Ru0ju1Gg87Y0kDrEiQb0jWcpq9F4Gv0XLM6vRwDH4ojjzINCLRPVPocAh+6Ra2w
	ty+TY3EkGaUyQ6gEUMoX2RBi/Bnj1izBqEGfhp4ye
X-Gm-Gg: ASbGncvgJHhpaIemIPHNHlSwrKWG1snfZualV8tBwcmXC7kZYf10rdBA9D2KjWoLWWr
	cGv+uNSeROr1nmySfolzy60roc+2/4tyvA5S+hgkD613uhUi9RwsRzxbrgQaVnQ9iXo2izQMi6a
	UpXs5OhSUH+Ud0PlBfztMppdDS/t2Yv7C8N5+xIuwCzzD57lZgNQ5w4oG4ozrbESHL7itx77LP5
	DcXOOX4Q3JOuI0MDWMcH11OPgtz/XAMkgw=
X-Google-Smtp-Source: AGHT+IEyU+tFAsFMORjYCQnykMeU/pbwHrSE3Y7T/aLBjOwuzBCNRlXwUTyFrlR8NysXmCw/f9p80hu9ipZkTsFJIJQ=
X-Received: by 2002:a05:651c:40cc:b0:32b:4521:73d1 with SMTP id
 38308e7fff4ca-330d260dbc5mr3824561fa.20.1753160313915; Mon, 21 Jul 2025
 21:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com> <20250715140224.206329-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250715140224.206329-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 12:58:22 +0800
X-Gm-Features: Ac12FXwqm1vj4VltrzTTMYOVI1lGXo2qDa8kdMFLAUiRJFcrn2uXXat6X0eoKOM
Message-ID: <CAGXv+5FXr-mGDG4mfqFx0o_dhi=Q3s=Yjpj79UVfEQKf2Wit2w@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_215836_587948_DFAD011C 
X-CRM114-Status: UNSURE (   9.27  )
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

On Tue, Jul 15, 2025 at 10:03=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
>
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

The descriptions match the datasheet and design notice I have.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

