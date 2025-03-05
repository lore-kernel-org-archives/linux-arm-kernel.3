Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D54C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XvWDEUMq04erEjB0dy5I+sM2+nP0CgSu78Orb4kT3U=; b=Z6nOc/jbd7uG0kAzJ85MjuIKa8
	jfhD+BYVoL/9DVQLm9bfRsGnm9fuXxkWv0cGlNASRbCYL+pQMbQWedEouhun8Sp+Malhb6J2MeRzJ
	SizShHieSVR9dLQW9tyHGdy92en7YWsrd7HyWd4hSqBNloVDGKf/wSQ1hWLdeb4CVAVIGxSbyLgMN
	EMU/Q4O6BlS3eiEQoE4x1hWvOtrVO1Ljcz9ljQf0H1qk0Nc2dVHEsycFIpyi1tnm4fRX8HA6wwZL1
	qkBniyYTIyVomUquPrVa281hg9h6HonN/F7FFxKSknl3ASDZsopi5rRAOZXHfSGDiYWEpbDoZqSjs
	WgYl4SDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq50-00000008QCW-3TrX;
	Wed, 05 Mar 2025 14:50:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq0T-00000008Ohi-3roo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:45:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61749A4587C;
	Wed,  5 Mar 2025 14:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBCFC4CED1;
	Wed,  5 Mar 2025 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741185956;
	bh=9XvWDEUMq04erEjB0dy5I+sM2+nP0CgSu78Orb4kT3U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KQ3ePrW2UjFrYDF+Nbz2H3HSxpA0DCwhiDatnIrcXGue6ZTEjg8Vwvs5VqZicRTeH
	 9ySwgtQtV7csxOgt1PE4Vk+kSPHcbEwk9oJ+gV5z2je1h2Mem4X1AZuFL1OCeiQ6fh
	 3qfTCjdDetgm65gqGNTFcAmgHlblBKRaPoGulb523SAIdHE7sDu1jO90F4tyVHkIZo
	 EzAOmhx75/VVf/CpEjZAGmnixgzgDrMc1u8RRQ/O5n6v0hFDHTkq36ZuLCU3GE1icB
	 4UwZIg566Y6ErRW1xz3uoW8P/KuVJCSNmRrTOrMrBSgUVAa8hcR0LoJQzpVpZHLzB2
	 ox9WyH5+ctLXw==
Date: Wed, 5 Mar 2025 14:45:39 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: <lee@kernel.org>, <ukleinek@kernel.org>, <alexandre.torgue@foss.st.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <devicetree@vger.kernel.org>,
 <wbg@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <olivier.moysan@foss.st.com>
Subject: Re: [PATCH v3 3/8] iio: trigger: stm32-lptimer: add support for
 stm32mp25
Message-ID: <20250305144539.54a75689@jic23-huawei>
In-Reply-To: <20250305094935.595667-4-fabrice.gasnier@foss.st.com>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
	<20250305094935.595667-4-fabrice.gasnier@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_064558_020881_AB2BA26A 
X-CRM114-Status: UNSURE (   9.01  )
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

On Wed, 5 Mar 2025 10:49:30 +0100
Fabrice Gasnier <fabrice.gasnier@foss.st.com> wrote:

> From: Olivier Moysan <olivier.moysan@foss.st.com>
>=20
> Add support for STM32MP25 SoC. Use newly introduced compatible to handle
> this new HW variant. Add new trigger definitions that can be used by the
> stm32 analog-to-digital converter. Use compatible data to identify them.
>=20
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Hi. Oops I replied to v1 without looking for other versions.
=46rom a quick glance feedback still applies here.


