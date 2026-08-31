Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF9BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yATNQWjrgyQ5QTRyqyuJy6Nu7sY180z8rTxRl7hDff8=; b=y+lphDmBRe8y7wh7dp1Gi9GYhH
	O+FnzgxPfSI+5ZDtzl1JYTIupaXnnTzjQiPoHHkMQXzuw2nN3enMvqYcrX0meGaxHgwbLQvhB7pZx
	bnY4fLo7WBLy94/NdDidLJUMckyVpbBBJWw9gSnkil8v11EiW403qTHe9P54oUm1/Jr2DjswPW4DA
	nOzAvrFq5+3cILB4Cuap2HsWikkqjPc7rK4s3ZfvmZ6MqWEQiinooEy7SyDo5f4bGOhRpvgXC/Q2m
	LuU9mrB1tKGzrGjhjCgjfr3ZvZFcEsiUsHXmAeAJ1uiRA23IZGHwCylBiDbhG/uUk8zgO00s8q1NK
	RmHOMAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11NL-00000009K7e-0ydB;
	Mon, 31 Aug 2026 12:44:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11NB-00000009K3t-2vB9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:44:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so24287875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 05:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788180264; x=1788785064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yATNQWjrgyQ5QTRyqyuJy6Nu7sY180z8rTxRl7hDff8=;
        b=ntX/3ntReadywECLsx2pDY4SoGf/ZzXHsDEthupL9LYFaCCY/fVFKeAR9JwLyrnQB/
         j56rpoYWlnRReUlGLlMy3qVz+NsuQHj9FgNuOXXCCWhkel0H3z2VBzKBEvgGs2k/RY0W
         0bsvosZp2FNLy2E7Rlc0UokszvVUTyDukFZj4+4RygzKecgrk5GfJVY2bEKjZ5rPM4H0
         gje4MpJKnDNp3etLld8YNt0z9o3nbDuFjNkWxiYrxJEFCEltkcemt7fJxs6I7boNE5cT
         OI+pQefZT+/P+DsxG9GjPMsshrAwvIP7nmtNrFIGI1kDDDjG4p5J2D8eyHsb6aSmHAOu
         glhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180264; x=1788785064;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yATNQWjrgyQ5QTRyqyuJy6Nu7sY180z8rTxRl7hDff8=;
        b=O41Nt1uKzCen3S85irQnf7LwOf0bT6DldXCjQpDFvNTxRcJYSumA6SXY+3w5Oyf0Fp
         15a5RDM1y78wlbkZyoZYDJkuyH391JM26mSeG4iPSK6F8K/mdAQzQTP+E+dkuynPI4Kv
         yS2UA2IxMF1y8+rtge34fyLeGS8BR6lA1h8v2NcBqvGigb3ZXDPynGeIQK05R4gEQf56
         zduwWzdqZoRXRWU3GnylIiuobfEqLR7qYpwxKYLpXWx7x2fZkT2Bd6Rwe9kG1hSSuvxP
         q0TvFUjtcpPFYqX9zomQzM46m1ebzdF/vw5RbOjxMpb7I6pTpKFQ3a9ciqO0PpT0I2nr
         eSvw==
X-Forwarded-Encrypted: i=1; AHgh+RqzI1gnT6BK9mHjMWV9F/c8+zetlAYHAKyRWn6idY1ZcjIQifrr3lxFxlxur1C9Fmbz/yt6st4gleQ8dmweqbVJ@lists.infradead.org
X-Gm-Message-State: AFuF++nc7bDvE1AlUnfxS/hHG9mdTPj5Ldt2UJgO38krjBqC2LS/OYMT
	Ni4o2LIvnMLYur7/xfwFFYIekJMy86nMI+VvhfdAanOJqFi91j56o05shMgO3JRXMyI=
X-Gm-Gg: AR+sD11nVdHJR+KawsVept4zp572n7tSnUseImuBO44vwqQA+qmX8ofRQRwiqiqjNhh
	Wyx3IrKKuyxa4wqs2BCIdI7d1y/mSKA+dPRAKrIX/6dYu2kIA5+3/t7O+r5ibyo5QXZHrVFnhmk
	o6w0pXLZvxP6X5P6C4gGvEu2dIieJ6lmt+Tj58dnq4PsQdcq6wQg+rPTtgX3qJo0qhrn3KS376l
	DAVSZqUbYaraBoStypBQiSXdmWDUlHcJAZ/HAeMQYdsH54/AoT7SbdtfMMT3ykOPkEs0C2TnN8H
	ibmJog7xN+PkkDCZNznqkNNYBxPZGVLMXqBlpXGpeX3f2FaTg0kLYmED97doCCAIIGmTzAkzZXW
	Dr+K/286VvWhG7cV350iuVVIzvobOXNevczTpsm+Ed7pQZTH5LbhNKfNRqOv61vkqbjMtzECcFB
	anxQxWUr/be95WJsJ7jf3cCnrvkumVo8LnpAO1IVDQ1WhWgv5a8s4baptrujbydG8PYOdz8EOUm
	zpCQpF9sg==
X-Received: by 2002:a05:600c:870f:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49cd538cb5fmr140459815e9.3.1788180263680;
        Mon, 31 Aug 2026 05:44:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1005:fa8b:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm390196485e9.12.2026.08.31.05.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:44:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Lucas Tanure <tanure@linux.com>
Cc: Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Brian Masney <bmasney@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Subject: Re: (subset) [PATCH 0/4] arm64: amlogic: t7: describe the VIM4
 supplies and keep the fabric clocks running
Message-Id: <178818026093.2318126.3676223463693214854.b4-ty@b4>
Date: Mon, 31 Aug 2026 14:44:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_054425_763615_217DF142 
X-CRM114-Status: GOOD (  15.10  )
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

Hi,

On Sat, 29 Aug 2026 10:47:54 +0100, Lucas Tanure wrote:
> The Khadas VIM4 has needed clk_ignore_unused to boot reliably. Without it
> the board hangs at random, loses storage and corrupts memory, and the
> failures move around from boot to boot.
> 
> Six of the SoC's PWM outputs drive the board's voltage regulators: the
> always-on domain, both CPU clusters, the GPU, the NPU and the DRAM. None
> of them were described, so Linux saw the outputs as unused and switched
> them off about a second into boot. The regulators then drifted away from
> the levels the bootloader had set, which is where the corruption and the
> random hangs came from.
> Thanks to Chuan Liu from Amlogic for helping me indetify which clocks are
> critical.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/fixes)

[2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
      https://git.kernel.org/amlogic/c/ae7be5c58a819259e5eb98a3abfa60842478f2ae
[3/4] arm64: dts: amlogic: t7: khadas-vim4: add the PWM-driven supplies
      https://git.kernel.org/amlogic/c/1e5a53bd16ac501e68463e84023d1bff543cc696
[4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
      https://git.kernel.org/amlogic/c/406292fd75f95aa3010fec95b5beb5a8b7e3ba3a

These changes has been applied on the intermediate git tree [1].

The v7.3/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


