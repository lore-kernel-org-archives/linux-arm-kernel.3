Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68653C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWYLLAv9+QSl6NuL+dXUwkLvPnzxxR6x37Sw+FNFkRE=; b=eybDCFVM4EuVIUtfs0k8eyFIdC
	9ZWxRkNnOij1sEb88GTBGcrqLXejxqrTxuVDNqrIyMgvdJIRSepgdywJ8z33Z5Z7BPkCTfdn91GX5
	MT4Nry/c7mI0rW2vSJ6azWq5W1RjvPZ/LggfZ+c8DKhwax0CwR0PAph04t9jn1Xo0vbFmjHCLhCcP
	FAsAjH6qGtR7x+6ktrELsZek3Hlq2cfSUZwdCEnPG7ClUviPCnga9qjXLNx2XZnhHHuW5DGIRNWNv
	NStQtswe0VdIbL2K+IboYcoGY0uL6NfdW2Zn86zqxya7SOZTVyGZIldWLrDZubnhVpgUuC0lMBZMW
	ftzrMpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoV3-00000005Fi0-00SK;
	Mon, 20 Jan 2025 09:55:17 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo6Y-00000005Bbb-0De7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:29:59 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5f4ce54feb8so2163933eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 01:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737365397; x=1737970197; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWYLLAv9+QSl6NuL+dXUwkLvPnzxxR6x37Sw+FNFkRE=;
        b=pNSi/brfw6ngpNFajrcfX/fCxISPkOiFnY3De3Oc69B/IgVARh/8IyhZ04wb4Qgx7E
         ilH08Rdd4h6e1KjAlgZGmGH+7zf0ZeyBk/mBPAiZQs6EDdzwAtha47y/2MMmJAaqkrSg
         pt9XE82yhao2vXkWHFdFLsyaP5bBr+8Ue1I0oDGhgjUzNC7XEQ0h0ikTI5NzVimCxG3Z
         Aj8BAiRd0wah4xuyG3cg+3d7zaMBbscgrLN0LU6SHbz3j1g6DgEt/fA5Fb/xf0ZyMHUd
         KF4Uu6K02ho4skXcke/PVqsdJ3EgaKXkLapsHc2TAn7wGfy23PHdTln06U9raSqDPRGI
         LhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365397; x=1737970197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWYLLAv9+QSl6NuL+dXUwkLvPnzxxR6x37Sw+FNFkRE=;
        b=J8kFZEEQghLLv+vscoOvzvYZJ+C5Ac3tOpWJ8WfYuL5l3mQ7y5FCPo+GxnHI1aDoDa
         pyt4HPWfsXP6P6aR76SsoDgpUuxU5SmtiXkmfmj0eWiudRRAD7h9bg4Z+hDbgiAOTj7R
         SdQHNY3guoWXfkDvrmTBnRZqchgG8IcY3OFBX9k+TWDcm3PoX3G7S7axWUtRg08gRboy
         raXA1EEJvDNPaqUXq7tDcPuYPJZxFAtRT04HNGSlAyg6/Z2OvrIALjtf7hW6OOMDEmlX
         TpQRQ2KuUPndF7azx3cLK4Gx3ZsS7MnPW3VE7yUGJcD5CG4OUeqTdCdHP3vmgraSwVng
         cKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyx3IKKbxbFQGhA6vfmyH1jOlVooiGdMTZU+M2kpgYczRynMelb0wA7ge2biE5JzfXLgsCH4ZsehShk9q9uNzZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzuUIZ6ljSjwIASr9OTDhSdygSVpF61A1YHQzW0Dypn6L5A6n/V
	J4ZwPGs6EHvGKWKKCi36Gu3mHGGGgF4Hp5OEaxrUqfEQyDblx1PiI/FesRpf1SJFW8hE8o36+Rl
	AyQl8xZbpBuP3m2GYuaH/vUwObXz6FUWiVmSuLQ==
X-Gm-Gg: ASbGncuay2+SHfTmblrE6E3HNkymKEo5NUpBUamqGHs8L1q+Ab6y3IE1CC4oYnr/oOP
	VEpixOiSHAC4fK2kVoQGrSojSTf3K1STTdEiiDTlWXAPL0ZLKrqQ=
X-Google-Smtp-Source: AGHT+IEh5ekB+In8kM4Kzz+JbIUW1L+SJB7JNRP1EJgfAXgE427tlnK9kpmUaBC4bYJQvBbjLwfn1zxxPfPvqK+oy6k=
X-Received: by 2002:a05:6820:2207:b0:5fa:2edd:8e65 with SMTP id
 006d021491bc7-5fa388d0974mr6833389eaf.8.1737365397006; Mon, 20 Jan 2025
 01:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org> <20250117-gs101-simplefb-v4-3-a5b90ca2f917@linaro.org>
In-Reply-To: <20250117-gs101-simplefb-v4-3-a5b90ca2f917@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 20 Jan 2025 09:29:46 +0000
X-Gm-Features: AbW1kvZszduHDYU3xxvIKBV97BoVaqY66zb0MrVDW0JhuNR8cdHWOmCpQEtzMwA
Message-ID: <CADrjBPoSHGqbC=8_-eWLO+E-ySMW+XNPKx3ypde=SS8-hrXqTQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: exynos: gs101-oriole: move common
 Pixel6 & 6Pro parts into a .dtsi
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012958_117749_86AAC8B2 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Andr=C3=A9,

On Fri, 17 Jan 2025 at 17:10, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> In order to support Pixel 6 (Oriole), Pixel 6 Pro (Raven), Pixel 6a
> (Bluejay), and all other versions correctly, we have to be able to
> distinguish them properly as we add support for more features.
>
> For example, Raven has a larger display. There are other differences,
> like battery design capacity, etc.
>
> Move all the parts that are common for now into a
> gs101-pixel-common.dtsi, and just leave the display related things in
> gs101-oriole.dts.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

