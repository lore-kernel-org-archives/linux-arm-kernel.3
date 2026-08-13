Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1171DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dGcfFS+7hS+n9L3WjL6EpmxEX7LHvUATyMdqsvRvBo=; b=oBCqY3NOyVQ5uiChglAgEYBr6C
	3UA25piL3ns7J8+8tBBDK27H7ZI4spxjBsQMT7j+8IoYpYF4jTH8qfii/tJbMtogT6QHo4EMvuLiJ
	I3fjZVbnXg0tmijP1oUi0/rRjvu++es0z0UGx5lMDBKtJFAh0Cnxmd0Lf/4DAwS7EANJ1dBg930kF
	O6P73NNcAPX0HqGsotKlT+wfkM4l2x9NC4kiTT5GE2MVT195N+eYLfXHtAA3GpZzKFxn1S7vMajms
	FTTeHE0jaFKF+Lsy70/Cz+vb/ADrW3JqTigQ9hiHT37gbHZ0MhGASQcW16+rCrMo28e+tLf907gyw
	4zlrwEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZCS-00000001I1a-21ez;
	Thu, 13 Aug 2026 17:26:40 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZCM-00000001HzK-1mIM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:26:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5b013aa02b2so1471080e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 10:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786641992; cv=none;
        d=google.com; s=arc-20260327;
        b=b7PjrLX5xuBGO3y4AJOMCsUhWvea6YObhFloy4g66PTjAIs/LVl6LiAcjJtlJ61L7i
         5PDKfaTwGfJsvnEkKhXkEW2F5hi9uSqZYZSCKQQlRrBYyke3YPjMMJaTEoe2vBNsSKmi
         6wmOE6Ccq6vxr4+VSuTzTu/KdeBiu2mNgLTjlL6OwqO31BL8nEcKO5tTcCfvVhYkONLo
         XczyWA712cmIXT1p+5s+ryL6A7dns1A/0qyToSAsuWEHR8mi+aQQ2uvdDty+z7qY4EV2
         l+jC+OWYBn8FBEGAOEoLQMt0AiYX06vWLGAPYf4gBiR0VS1xpHoPlqDXHJCBY8FuCmFQ
         WoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dGcfFS+7hS+n9L3WjL6EpmxEX7LHvUATyMdqsvRvBo=;
        fh=x9POC12DXeD8+qkgXtog/jGutTAWF5H3yUeZACmec8E=;
        b=CUJzjEZDVNDbpn7/tk8e+YsmSYO9E69/t2UsLz59cTYyxpa1PSFSbItvuwNb8Uylti
         ekN/WETk31WBViXfME9bNkj6H6fuowpPbOav6uTtbDTVS2cjQ6nj52fUrKa+Qv7Bkmbs
         Sa3m3q8qFrhJmDWSebX3acOIHcbhqolxK+1E/c5te3UfmyZN7BqbIvKTOA9+znemf8+v
         lYJsF2s0w3gAbXQLLEpoz67wfz+H90EB2DX4phr/LCeK2XPR1SCakC9YApUQlWlf7nxk
         kiWiXOpuR9oGi+c5Y6RuyL5z9A3rfAMq28pCfryRB3i4WGqQMHrfVwmdgOR9F/OJrhPW
         XjfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786641992; x=1787246792; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dGcfFS+7hS+n9L3WjL6EpmxEX7LHvUATyMdqsvRvBo=;
        b=BORbtnil+GIX/D/IKloAujxRdfE5RkzFqBK+ciHT0UIBGIayAWRobad//J6q9NnREk
         EjRXCk2QafPZbND/TTa34ngexacvE6LfzpndTlzxwwV9j/EPRraJOee7YMa6/GXqfdf9
         JjJBL9AB/C4QqxjgPwM04rioQ89MD4Hj8fFg6q7GR/2ry7XVBC7KR08ksh8YIe4NNivb
         J/EV1w8Bazu6/ihPKTwC4u+R8CQAJ+ZSKJC+Bg5VdQgrYgYCVfmL5Ok77IvpM8bks7WX
         ZFTdDt0SLb2LVy8Vw7Vf1JJ+60qV7N6+9AAvH4bALv7ipPvlqoGwjsFiaxnb4oMZJC7O
         cFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786641992; x=1787246792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dGcfFS+7hS+n9L3WjL6EpmxEX7LHvUATyMdqsvRvBo=;
        b=dAj+3H43pkJKsXN/uhRtOFVG6XQJMUb/akl+yuQhvLsnbHol9D1r3bm1jdwKk0/ZdC
         0B52YT6UBwT6nl8n8eZ30QqKtSJb9XJSJz2cz0Rqtl3jhDuNmocLvezhX31ThPtS0xUH
         9BlozySfdicwAmT02tHfcAZCqWAudHRaKFiaCc3g0n5D8DgdwIcVw+220LebT7vs6Vac
         Xdzqnx0Krcn7ePp7FhLjWExL6ZTrn69tbCrPzf+4aMNUFf7OV4N0oetvMmdb/tpUg9sI
         1zJjmf84DFqJ/9IQp/T+G0wDNnN9a++P5bip0ronQDcH2fPI7tlhfPRIsRlol5pQBYCF
         UkMQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBTk5tWuHkd6jkc6gX2TakADQIgzUkahx3YqLk3Z2vIExH5uEvOoV8QYPbJZ3yI/PO2m5rM3HIobRfJejrsRkz@lists.infradead.org
X-Gm-Message-State: AOJu0YyYwVWCfuXWqivGUEg6w/tiFQ8MZf8V8GG88sXgXa625bDcabyM
	1w47EusyCwTsijLmLi4DiHNXIFv1jymrFtOImL7MiEGDj8BruyycTvnbhbVltd5nFbLtnnCZRwA
	hvhT4o2qj5U7/vR5bD3anFYl9QTFrBEE=
X-Gm-Gg: AR+sD12Lz1cw17NX581r1APT+ZRWec1/8Nb5/AEI38mGqLeQbsRtUw+VNAXwLzH30KR
	KXBuihNT1VOkqwAijcIgJhWmd1aUi8ZHWfzc8Hc2VEYadq/Gn1SQc0zEOx7NTD4gtUO1wNgRm6D
	qFi63i1F9FpgPHsw3l7hzI8uEhK178G86qEYzx8JmYRX2YSPYDBbrFlBYp7TNI3ga99Ln/DxFiE
	143EjzDWhFHbS9dmauI7qAYoPlcjOF0o8sp1oZ5SbZoTQtOUcimSbvi9rJzz5f61sQpNOBxQ4Z4
	WDcFHB6rKzCxNvY7z/mGfZ6JtRl7dpyN5yru4fVU6mPd3A==
X-Received: by 2002:a05:6512:3f25:b0:5b1:4c14:9b3d with SMTP id
 2adb3069b0e04-5b453cc57a2mr1544652e87.11.1786641991684; Thu, 13 Aug 2026
 10:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781622998.git.geraldogabriel@gmail.com>
In-Reply-To: <cover.1781622998.git.geraldogabriel@gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 13 Aug 2026 14:26:20 -0300
X-Gm-Features: AUfX_mxjuOfsACV2NcpMvanMb2F3tMylLUszlHpzH8YkVOIfS0W3_-lZ3FK3lac
Message-ID: <CAEsQvcv7AddxRsy5vr_pkTYPs0zm7w60NxxpS3r2_va68yN5Ow@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] PCI: rockchip: 5.0 GT/s speed discouraged by Rockchip
To: Shawn Lin <shawn.lin@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_102634_495700_51375388 
X-CRM114-Status: GOOD (  20.37  )
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

Hi everyone,
a question to PCI maintainers:

It's been two months already since v7 with no response anymore from
you guys. Is there a specific thing you're waiting, like an ACK from
Shawn Lin? Or perhaps this has been forgotten about?

Thanks,
Geraldo Nascimento

On Tue, Jun 16, 2026 at 12:24=E2=80=AFPM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> Dragan Simic already had warned me of potential issues with 5.0 GT/s
> speed operation in Rockchip PCIe. However, in recent interactions
> with Shawn Lin from Rockchip it came to my attention there's grave
> danger in the unknown errata regarding 5.0 GT/s operational speed
> of their PCIe core, including data loss.
>
> Drop all code related to 5.0 GT/s operational speed from this driver.
>
> Endpoint Mode driver was not tested.
>
> Changes in v7:
> - In pcie-rockchip.c (PATCH 3) drop unreachable code
> - Link to v6: https://lore.kernel.org/all/cover.1781207474.git.geraldogab=
riel@gmail.com/T/
>
> Changes in v6:
> - Squashed patches 3 & 4 together as suggested by Mani
> - More formal warning message as suggested by Dragan
> - Set the 2.5 GT/s bit regardless of if link-speed is set to 2
> - Link to v5: https://lore.kernel.org/all/cover.1772239598.git.geraldogab=
riel@gmail.com/T/
>
> Changes in v5:
> - Changed commit order to not break builds and adjusted copy pasted
>   commit message. (thanks Charalampos!)
> - Reintroduced behavior to force 2.5 GT/s in case there's something
>   non-default in the DT. (thanks Dragan!)
> - Link to v4: https://lore.kernel.org/linux-rockchip/cover.1772169998.git=
.geraldogabriel@gmail.com/T/
>
> Changes in v4:
> - Incorporate suggestion by Bjorn and refined by Dragan to drop the
>   "catastrophic" code
> - Link to v3: https://lore.kernel.org/linux-rockchip/cover.1772057799.git=
.geraldogabriel@gmail.com/T/
>
> Changes in v3:
> - Clarify warning message even though Rockchip won't disclose details
> - Drop DT changes as they were applied as subset by Heiko
> - Link to v2: https://lore.kernel.org/all/cover.1763415705.git.geraldogab=
riel@gmail.com/T/
>
> Changes in v2:
> - hard limit to 2.5 GT/s, not just warn
> - add Reported-by: and Reviewed-by: Dragan Simic
> - remove redundant declaration of max-link-speed from helios64 dts
> - fix Link: of helios64 patch
> - simplify RC mode comment
> - Link to v1: https://lore.kernel.org/all/aRhR79u5BPtRRFw3@geday/T/
>
> Geraldo Nascimento (3):
>   PCI: rockchip-ep: do not attempt 5.0 GT/s retraining
>   PCI: rockchip-host: do not attempt 5.0 GT/s retraining
>   PCI: rockchip: drive at 2.5 GT/s, error other speeds
>
>  drivers/pci/controller/pcie-rockchip-ep.c   | 13 -------------
>  drivers/pci/controller/pcie-rockchip-host.c | 20 --------------------
>  drivers/pci/controller/pcie-rockchip.c      | 14 ++++++--------
>  drivers/pci/controller/pcie-rockchip.h      |  3 ---
>  4 files changed, 6 insertions(+), 44 deletions(-)
>
> --
> 2.54.0
>

