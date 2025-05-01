Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AE9C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 05:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89ehVUbqomSF6K0l4N5MZoUjSBvF5esyiUm5mG5feyA=; b=P1+s4s9IrNomBDyydl6aFEd6hl
	SIgfTb4AJ2hni+S+Lswq08QVX1SaegMV+9cMkz1U8d0MBO7NkqOK8QbjIO+q6Gd0UWAVrvpn7wuVV
	qfCyUl2RjOcyE9gs3hR/XJ7wLMpEGyAAsA16sb1Gs/zbaNTJE647e5GR7uBSM8HXFnkwVT14cTURB
	y8b1DtcfQTzB8CbFCWysgYDQUjz2Gr63lA4898bAjGqb7xACkPDV+XGbThj3u1XiHM/MfGHBPmZv/
	kGur1nOOWXVmw76oTm08Yq+EcAABfXTITeVjlri8NHbsdAwPVoUer8H2TCpbk47xeOfkoV74eFn6v
	H4rW/TmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAM8n-0000000Ejrj-32Dt;
	Thu, 01 May 2025 05:07:21 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAM6t-0000000Ejf6-1nsg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 05:05:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so923937a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 22:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746075921; x=1746680721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89ehVUbqomSF6K0l4N5MZoUjSBvF5esyiUm5mG5feyA=;
        b=WNVzTKn3ox13itonG27LbbO5IugrO9hrhadWnG1nVb1alMVT/N1uGYPUhIsusZI4P0
         99SHNorAA5QrxTiP274EQqxLDFxIZfaGEKP6pOCdO0sEaXFRiZyDxoqdMTeNOORsqS1H
         6OpT0QHugVNjCrkhdUH8cvrW0ka1nd8DSHBYVVKTuEtqdDiJ/24/EQmAoTcLCklvKyea
         WAfSpVjcO4w3p8QBFzXH2B5BaFA8//ftU52csJQdLd+fZ7D/Hr5ztdtKCdGydaUjJzwf
         OaLRGvOCY49XKqx5igmYEDjaANP3GrLEVziZDGheWdgJJnrQEjqAlqzs4ot7kVFMbmc1
         Rrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746075921; x=1746680721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89ehVUbqomSF6K0l4N5MZoUjSBvF5esyiUm5mG5feyA=;
        b=IRg+tXWT79hGm3eF7TFSERYpboJS+z425yDVXDGqNqv7tFKGawZDDfDTUQUSxVaOZD
         iPjLKMGIJ0yaQDyT08IuABOR+wCMn9cFMvTHgfYW7VBFJQty0s/3OZeF8ZFIX4C8iuCS
         bMBjS/UbJNGuRpS3utI7g7nFQQrN8p57bKFlVbhm79qNktVMj+1czGgCp1NYkUhsjiF1
         SiWLhMnPuw7qtEBBDVOwXwwIhrtL29DY/nrMqz5YnLLafDBqeZZgTm/NJHk7HzJR5JdF
         Im1LECzAFRVqAEcmhAnr4TvmtwM41m3zwwFscDzD2cxKMFyD4j96OJ+3k6ZHxJghuBig
         HuYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLGYaFMP8PIxoobhsPk/XyAyJy+KGnNCq3dTYA/4d0Dd4+5VIqJ+PGaorsZolMj2aym110XpuD9w4zTdwYZJol@lists.infradead.org
X-Gm-Message-State: AOJu0YyG9uLac8Zy5a2laiOIVWdNUWxlOUa9yTR0edzHXV2HLoZEe36k
	BIDWJ0lKpcy+8bfWudlj7V9X3L4rf9It1IvTh0UGlIks91ycLtEG
X-Gm-Gg: ASbGncvcuIOgLA+x0gSiGt2iVbLsEXUg5adS163614osrugjBX8fhrilqAxTKgD+EyR
	4sehLoDthcjUrPQcZf1CNYoZ5JDQB4A/zgI3Aud8U8SnVfSQy4l/6IlQN1PSpzrRG+sdv46Bumc
	nX00ehMN98rvnqfPtmbGd3IJrb2jB6cuss6AuysoBmimiRCmOfwZSqCM+s54MNsDH589H5Llq9V
	KGaRNwb4nlvTAkjSxbyspZUynsvvsKaY9p85dV1h1+q1XwQJ2yMFkBKKSkmGhdC+vrvilXytMzt
	wSu4Di062bVpu/r30waUOCBsI647L07/h3ZhMwe80n2hfKxJAN4kHkff+g8IFFIp9/ArszQ5uE/
	frlrSNmgazePxtb/f
X-Google-Smtp-Source: AGHT+IFslrSBgwP2oKjTyz3yJ6G0zEWqRhVwWhyXN+S+K5UzJwFMqvffPBISy6dAiekefanLK4YUUA==
X-Received: by 2002:a05:6402:3494:b0:5e5:b53:fd49 with SMTP id 4fb4d7f45d1cf-5f8aef17766mr5400131a12.3.1746075920933;
        Wed, 30 Apr 2025 22:05:20 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc361sm9510920a12.16.2025.04.30.22.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 22:05:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
Date: Thu, 01 May 2025 07:05:19 +0200
Message-ID: <2220249.irdbgypaU6@jernej-laptop>
In-Reply-To: <20250430095325.477311-1-andre.przywara@arm.com>
References: <20250430095325.477311-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_220523_463999_4E1FD358 
X-CRM114-Status: UNSURE (   9.87  )
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

Dne sreda, 30. april 2025 ob 11:53:25 Srednjeevropski poletni =C4=8Das je A=
ndre Przywara napisal(a):
> When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the order
> of the last two arguments was different between the users and the
> definition: features became flags and flags became features.
>=20
> This just didn't end up in a desaster yet because most users ended up
> passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> not yet used.
>=20
> Swap the order of the arguments in the definition, so that users stay
> untouched.
>=20
> Fixes: cdbb9d0d09db ("clk: sunxi-ng: mp: provide wrappers for setting fea=
ture flags")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



