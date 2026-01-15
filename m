Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4A0D3CC9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 08:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5whZZY0NFTuaVPJTKC+j24tM3a2qyIAuO69Q21m6x8s=; b=v2LfO4dV3WmePjA81fCsPw3EDa
	soczh0Xy+vH7mXmY6XNhst0WRsobApeTLlhkqThnEtwYr78tWeiD9tZdndggxyTyZopy1kKAPqSts
	o6JaraLYAYNhzDhq5x5TRXPaUCztlvKqmnV+kwOfVJTk2s/AtdkY6367kXq4Yhfg8/zHJ3PWdhss9
	ZJeivC/3yddLjoiq41UGveL/xiEMJazrw3TjMAJMC0HFn4FnTRbyFdcBLV9p7F0tJM4uaZLqpdGF4
	+vUZD1APOtF29qtH//2WZeQGTo69sUJ+5KNk9Sf5eUEtBQf3WLXcifR5ySzp9XJEQtDaQ+4k4HaTs
	LxmbimuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgING-0000000By8k-3GVZ;
	Thu, 15 Jan 2026 08:06:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIN9-0000000By7O-3HpG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Jan 2026 08:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5whZZY0NFTuaVPJTKC+j24tM3a2qyIAuO69Q21m6x8s=; b=WKJNk65WlIVj9qIQfSlAacVwob
	7EjUbPwR9R8xY0NXvoDe7Ry1DUaopTJ5vr3v+FDR8qAgEVBTMGaGklJQXupqoESo/QJxvdfQuUJ1z
	JBwnbqNinWlhBDvrJoHzBDCB/WK1QdZ+aW68dI4SzOwtH0wmuToQ14Bk4EYdABbONnHeXYqnTlnC/
	UYjCDlWVBBd56Iho4n/RQQUEA9vU89zAEdxcIgjb02wet6rI/It8xsRsMyWgINCDXXB1oJXI6fbbH
	RaW9JA66lHNCWNa63+0sYcL+uoOZC+jLv7pis+JgrCmS8ONccVASsne0Plxbr7aBZTRsNLZfzvUoU
	BFEtDNhQ==;
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIN4-00000006HAl-3yp5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 08:06:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so987605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 00:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768464380; x=1769069180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5whZZY0NFTuaVPJTKC+j24tM3a2qyIAuO69Q21m6x8s=;
        b=oC//F3DW5A6xSr1NmNlMgcEig94QueIriAwkOqR4n0k+Z0/HOILTjOuFOLWFT2kPIF
         aGF+S7+F8ydKKVCrnHvEu+u4hqFh1E2/qTm5ndLUn33jKVwT6nrqsTEe65QWmJ4UC6yt
         xqAGM86bCtwgTtEpmqihA5CbbYSUKeXOS8HXDLznvYW32EKg+5X9pq5Z/YHeJvX9NukB
         s61dZxJuQwzb3bf/3594O52ifFKkTMG4GneOe34rdgiJAlfHRW7bLJtJ79aOxsnyx4aT
         TjwJeRCx4uPTP2Z31nbPoCj/pFiczLyyTF4SbSk/91Q4U0k3KUa3VuWe6na1ZxzxTF9x
         xXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464380; x=1769069180;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5whZZY0NFTuaVPJTKC+j24tM3a2qyIAuO69Q21m6x8s=;
        b=knoJ3+mVJxIlrf8SItvyAZOJyKGURxgG+fzL/4gFRJTqKTrMMKbe923xNuzjUgoMpu
         W6U6Qa2+jOq9ahv+A21FuC3BYoBQW2fLBQcB2/oatpMniLIhvtZ4uaWZLCpM7/EKQlYu
         YFhFMkFKqRlZzYw+CO+lzfQjR5TfV1Wjv+U7VUr4/TNetEfIaUaXY1eVFDylPKUcyLNv
         F2E9+scFGQEpbxMRJlNI/jw8qKIDQ0NUPZQ8GuB56vhKICaWnfzbHV52DR/AevlbZdB/
         oX3XJYgjvRAwe4qzBGCrs3TfZpKD94e+s9yuBbOPCmXV6z2Bk1dZsgX/kfZq9VFBZLK8
         yEcA==
X-Forwarded-Encrypted: i=1; AJvYcCUEYfEOd+z3kFms3/eLsThd7r2fQ9D+t4VcJzlLCYwZiY+coPywBPrZnzdGkc36mBtv3VeRgWCQvFWa7Nd9GkCW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4e28SKKHWNsBrlTC7fQOovfUijAXDshI6puZDO+HAaa9Dz3pB
	yQnlXbXBL3S0bBJDVthq9xFMHmSJu6KK/aWQnxnewf2itlI15wFGluV3rQl7S9lY+Xg=
X-Gm-Gg: AY/fxX7o7N+5nOnEAtTVvcJa71I5Anf/KeCOtxJZeP1CswFKVdo8RO9MPDrNF4S4vMo
	fWVy/GBLo+fuspnz0vRVwvBegiFhSnQVpdwpjCk0PD6z8zdoTjDFrYsP9Q6x9bxUqgacS90+uIj
	NljILpbItdRAeAkuMM7OwDTUX+m6/DuNsngx2i0AcI7P0kUIRvLXbvf1kJnHXrnsEOamSl1lQjS
	r9CPDfEV4HwmzTymubWHyAPtSDUSffyegVKb+WAD+dUgWvlpfg9lvcdVIdZxs5Ma7dP9Je69kWS
	f/WO3XEbhmIwC6tJ4b1kq4VdKS8nxfrFlB8t0KMzpZU3KmVy5FpWZ5ibNFExbBfraw8G77Pr60n
	48yX0Nz2YxSl4xN3cuVXnY0EX+dh6O7K9FbrulQTPFrHZkbpM3nROoVe3MphjDKzCG6mTvpy7t2
	YN+t2BnjCbn7Ez2FyQpxghDrJK1lcc51eQLmw+TzMS6Q==
X-Received: by 2002:a05:600c:314f:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-47ee335fb15mr57018655e9.25.1768464380292;
        Thu, 15 Jan 2026 00:06:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b789sm32875245e9.1.2026.01.15.00.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:06:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ricardo Pardini <ricardo@pardini.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
Subject: Re: [PATCH 0/2] NPU and i2c3 + FUSB302 addition for Radxa Zero 2
Message-Id: <176846437964.1204537.11505642254935473121.b4-ty@linaro.org>
Date: Thu, 15 Jan 2026 09:06:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_080623_358966_F8A9C606 
X-CRM114-Status: GOOD (  12.88  )
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

On Wed, 14 Jan 2026 23:48:35 +0100, Ricardo Pardini wrote:
> This series adds a few things missing from the Radxa Zero 2:
> 
> 1) NPU (etnaviv), just enable the node, similar to what was done for VIM3
> 2) i2c3 (also exposed on the 40-pin header) and the FUSB302 at 0x22
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/2] arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
      https://git.kernel.org/amlogic/c/29deec49146162d06b17739c627d062191e03814
[2/2] arm64: dts: amlogic: add the type-c controller on Radxa Zero 2
      https://git.kernel.org/amlogic/c/8f5aa8d444d1d200715c36a8f072054a49bfb410

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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


