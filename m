Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B61F513EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=; b=iWrFgZ1I64gUG3cba0cZE6xIpC
	Yz8M7vzdwn9N3JRhLecAdCrCLSACD2K5eRisRPsqZx74BLrHRWeFkXeSj9W0iLrf+9eo6OJbMa2L/
	CxhMmpj1W5QYGi3nvaqznPYJeTydaRC5/EPTlGYWNGsCPPOXgXkd60ChgMqCdgaOULRpozzMzyaxv
	LIe/7rf0//eM8SV7P7O3zyQq2NTxYJaIdnAPutGFNFwBe08Y9X0R9Eh3P+ZGejW+UA2R+XcrEcpsx
	A03pHo+IuuyzCx1GopxzPeZF4mlRvMMO+Oubf9uvEoZRZTy3tcj18Ss8pBn4md/mo7XI8b6NauDn7
	GtlGABhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLHV-00000002uoC-2V4W;
	Fri, 06 Mar 2026 02:51:13 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLHT-00000002unm-2pBA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 02:51:12 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3870df2331aso72461641fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 18:51:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772765469; cv=none;
        d=google.com; s=arc-20240605;
        b=kpgbLKm8UtjqE+ouWZVYJnLvU5oBy26H5P8ETYm3TnZQDIpBjUvDpfBNymzbLftYQC
         /JXfyhn7LIx0ECt7kgVStQfQo0Ny8uOyZliGxpFl/IQLhQY3pJ7rGfmhgfkZ5vhwsHH8
         xi7I/RgKxfP3f9K84calso2w9fLNxObdCIBoADtHyMSTQ4IBEdE0GqCW1qfj5/9Np1Mv
         zFg12id185NSp5HY+WVG7fu6bteuOWZ4Ziqj8zWGoav061UElwDExU6YgGDdehcTZFUf
         e33qKiESTkMFhjobsSxuZKV8EWHbivJK4sn23Ct/jEV2034jcJZpxKOSZaejTAugreWY
         Gb5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
        fh=hTlktP5B7bhDEg5xSSubbpRa+wt9IdZlzOQUMMPogj8=;
        b=H8tb0ozpfaDhqaqgGKIEaIvkTMGoE32Ze64qyA0kNbuer0jPQgOz0yk2cq3uVSgesC
         nXnZ1/pt1Lo6jBZsLTSWWRujC2vFfIOFMX0cNr975QKiaiaAUyoylvFs61Rv+4KHnA4F
         /ZzdWgsh19vOs4n4Mkbw5DsHyBEl3Z4B0TffoIZWZBQPgY8y7Yw9AcL9Mr6vLKjY6Ixm
         btCaCvIVBERnJNEU6KK09w2w502WsnBsZLO7phINU6LtgLane23cO/x/AGvU8eJijmMq
         Ik1v5Okv601EjCz+7FH4XTkd0tmZRU0UTFuxLwU4nGOwa5nxFRL442/OgAKsRqa6Tcje
         lhrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772765469; x=1773370269; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
        b=V15cIwAxTJMvRV52q2UKVe/O/bF5nXipQd7i6c+vwDh6lXdBrNsZotM0qeJ35DPcWg
         rilMCP92UMcdwgcapgJptDgOyYuypkyrfDozc98D2EInn0Rs6mXOL8fJDZsE7FMS5WFQ
         L8tRdZehrOm7E2GwXyz9XgLMuBlXsDaKC2DEVwC/2meBPvQCOPAaFVZM/GCGJfFojUIJ
         ZgTgGtJjgnqJgMeNU4TRa/jcXHU/fnlQGu0KDmaip8Cgwr+sx2wRbbepjKQVOBL+FNmL
         Z5ubKAqahVWNGgL2pRSMclOU3hpoQEIfk55eLsZkQ/46AABshTpF/AIrgOhGILds9KLS
         a3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772765469; x=1773370269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=le9pM75U+VH6RnwbdxgpjIvWcDTvW+QXlb5uvCpDhYk=;
        b=WeNzRP99EMssugiAWtxakHYYmZXiK3ytiHNYuAi8p76tBkDVNIkphGFJdz9rFYIISE
         ubuXai4PTEXRP2R/QaisX51ZhlwxytivuvIXDgeY+BjBKnLRR1iopWEoY770NqahbUrr
         xk/YXABzE6d25qid/fWQuAp9WLL+EFb9tTI9KIBttwpRMuDpD+oP7SSs5L5mehQgwnLm
         sZobb6vd32QbRZ4Kupb83IiUNOIuik/cgsh02AIAtYkNXAosew6P1nIhni9M9Xj+UfYO
         zmZkjl5jgxyCR1+QCM7w8rtPjnihhmjRaSOVNY9fqPHmyEJpIywTkBEhugcq5TdnszxZ
         R1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUUOy5hUwFtM7ergS2p2INQe5nmsFwE7gd038EyTQafxjexykj35CUE21wtqYB6JOj6RBf5qNy2XtS4MaNXU8lZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzuhOG8OoRkxW5DJLLVtFbFpgluOsz/Egv5a0l9AyWbgKHiwlIC
	pWxlVhQ8GxpV3cBUDrZfgMfnaOx2rkcuvFvrqccV9ah1O/5H1ARIjDn+mBr7TOWknq8D74Hr73+
	gzuO9gMnqTkN2/OYWYgUImTUHOWfoJhM=
X-Gm-Gg: ATEYQzwbEXQZajO5SfSe8P1s0KpRm8RowN8NSSrKlUpiu51L9FK1XeSJs/to2GP6gdr
	wN/PeQD04tJ8p+PrmjET0apd1mTIrdgEwHloumXyl38RApSZ353hA79k9gCmHn318COoRGGgrLi
	SyFudoNDMWEnCDwLv5D8CMJMA27QkOSDAz9z3+Z0tEu92QUOrUIhMo3QbPjBOBHWHqFfRBnPoBm
	CMkU2E+PyeqwIRa8ov4RtXdn+sAxsD1gMLUam1UTc30Sp8R3UwTCn9N8ohU5dUZRrKpxHAPfhRL
	fBDwp2BLDSAoDRKeOoW7izGenuJwSGe/0CiUNLvtNOyDaqfEsmhm3Lv6DbYS6BIblPphKAz3
X-Received: by 2002:a05:651c:620:b0:389:df67:64ef with SMTP id
 38308e7fff4ca-38a352a4a0amr11338661fa.20.1772765469411; Thu, 05 Mar 2026
 18:51:09 -0800 (PST)
MIME-Version: 1.0
References: <20260306022406.760-1-ming.qian@oss.nxp.com> <CAOMZO5BP2aLD+a1r7hVd3F4Qvfovxb8PgQfzcVRKknBHWYBmtg@mail.gmail.com>
 <61e260e0-4544-4c51-99bf-c4815367fa94@oss.nxp.com>
In-Reply-To: <61e260e0-4544-4c51-99bf-c4815367fa94@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Mar 2026 23:50:58 -0300
X-Gm-Features: AaiRm52ueFUXaqQfpowdXyDTPs2aKgG6aHElJW7IWO6H3_-P9HAhh7hH09TPm6U
Message-ID: <CAOMZO5AYRWBykSdvogO0Ea6JidjgY_h5drnBpcDNFrU_oo_L2Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	nicolas@ndufresne.ca, benjamin.gaignard@collabora.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, m.felsch@pengutronix.de, 
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, 
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_185111_788244_D234FCF6 
X-CRM114-Status: UNSURE (   8.77  )
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

On Thu, Mar 5, 2026 at 11:47=E2=80=AFPM Ming Qian(OSS) <ming.qian@oss.nxp.c=
om> wrote:

> > Drop this change. It is unrelated.
>
> But without this, the checkpatch.pl will report error:

Please do this in a separate patch.

The goal of this one is to fix the kernel panic. Don't mix other
changes with it.

