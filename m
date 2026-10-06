Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182BFCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=; b=4/9posyjY8ut+AVUnkthxXnJT6
	vyowbq3K6NRee3Mrfa6cVzA9vEP4slYbFUoIwlsVFy6O+RaHCVZOjZ9AG/Hb6yBWoFJ1stJH5tmK3
	GkaiedUbmgAVLR/UJWGp6pQbKsKxoKIfsWruznGx6c91BcW5z4H3T7r3nf1NJ5t+ELnCE0uVXIsMp
	qi+C5tzMwxoRpNxbL8T5ikmxbUlO5wucO+34Z2BXheGL5v7d5QrLPFv1I3EMqP7sUITVCVtjf/6VQ
	eOpLQpA0GXPy0X/w7Tt5XnSMy83hTTINbvM5WWknFa9NNQKNU+R/n1SgnhZYxvI9bPV40HlUL3iLq
	FkA0PS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE33T-00000000be3-0fUe;
	Tue, 06 Oct 2026 11:09:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE33Q-00000000bd7-3P08
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 11:09:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e4a341d177so15642005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 04:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791284992; cv=none;
        d=google.com; s=arc-20260327;
        b=LO3CZ1POoHUbzZXdQG3zinsE/tDo8sWScrsSYLKM9SjGXlRTYWWVKxUV4isktFxcBU
         3n7q0GFrMgl7+wi1oJb02Ab1baJ2rvtKp/xvUPJlioOX3mTCu7pJmX7VYERAkGB71E4N
         sC+4DHtli3Q4gBIWw4Xnvz3GNxHPMCkJTTZgaBrfQ8f2xBORfLcf3e49etEHXNpzCN41
         b2Wnyd+Tuvx2aYd6/RF9SMhHJsney4mDi+s6QStpKXNeMtvT+hoGZGtr2SyqDG9OE+Sl
         wTjixzgSUSdKFFWYHjVH8StHvT0NCnmg2lebl/F9McpEiinigIW7o8oQnfh2esRssuaD
         TLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        fh=tQ/o5/s0IRTdrD1dN6erPRRA2zHu/j6fgNoc8SyoXWA=;
        b=f7eJfeg+ndLM7igKHw4IIbqzt1n8HWez9jK4767e17suHEdWM35JYWz/5yJ1pR4B7z
         hapxWVxASMI6B8xM9x4dIW9+XU9a6dDBweHT932xH6epe58mfP8dMgEVNBWuQurG7gwO
         NH3KuwIJcJiIjn0P/dB1Yqpn5dOuOwK3G4J4YDFeBJCKDoRKKwXjbDyovzI6+R9JUyvp
         gOAs5s3Sy7u5hVfq3t+TG9xYYVytUe28IZtuBEjbGCkfj7fx9olu68NnVvVbK/mhpo+b
         gNt5IeYRzHTsnSXg40N3f0G1SmU5kC1aGHOD/RGLd0NRjjmbaBmfgxSnlPrpRA3j6e8o
         MqMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791284992; x=1791889792; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        b=bXwqp8ch4I0BZ/r0lRjUnH6PaxKe9qN9EdBrAF+Zgl7p4EYwTCVVNJfUgsvvnuIHTn
         0RPjvXWo/Pg3NjbDm+ujbTTTCqV2Cth4gMIM44mO4CYuoKa2Vyy1w2iL3gcRXuPiYWP0
         Pz26BcyLLskJOQwl0P5J2/guEzYSD8iQ5MzFWW3dEkof7P3VYepB04OpsmUUZ+6DmWkI
         aumakyy8D/WFMYUxFuOWfLyG/XYAbY+nSZWdCL/gNVRfXX4r0CJcqtAebP7RCtOcmFOD
         v/3n5huREb+g4tHchGu1YkKpu7iq2WULYnBQqQZYCyAaTyLMCSHAFDsgNXbzmg4W0eC7
         a9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284992; x=1791889792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2gHAHJjsWGwgVyBCVP7AcOw/LnAUaiF4NONapI8nsJc=;
        b=puGSuL4OGn5Ko1ClavrA6sRnE7TJGhJCaz4B9OrD1ewltEqDwX4yZR1AnfhoOvOXbC
         RzBJsuDDxxU7PBn+NMOBIhRX6jXTlGQCCwzPAlTpOblKJVo5Fla0qDUecgpX5uK0hMTg
         41TvDTmeE4oMqKILU1xQ8EAMb1OlzOx1osMx3h+36hwR5ZlxzBRXmLQhuUnZMCgP23gQ
         OsjPH8W71EB4GZeCrMFHVk4G0S5F4U82T1G78fySlIAOHrphz+ClPaZVDg7r9h2z7IxA
         1N+RIsGzhx9NEKv9UwrQTXiY+wv42FsEgBY7fbl9PlHhM7YG3BUj3zr0XV9Bh/9+T/pb
         dWsw==
X-Forwarded-Encrypted: i=1; AKwUvBwBTRGtIqEJtpWNFbVFXlYB6myTuliaLLMTz71zJJUhcNQCpAe2g4WZj9wORIJTj2yGyv0AfERg8tOV/5Mq6aiS@lists.infradead.org
X-Gm-Message-State: AFq9FYL8MYG/tUWq06tsFJTGRm294uLr8gofRPG1GzLSkL/8yVAkPUTN
	vYpo5Ld8sN3WZhbdCwoAkXzRaGjgNo0VWNR1Yh0zlE1z0825nZh09JAceVXAJvh5N78xyMtRRFk
	ZvxNMyVBwcmyIY/kr4KZhoYKRJ6wVwXc=
X-Gm-Gg: AYBFou0qbaGxVX/lM7oA15TuJ74j4BZ60MzmEQzbz7jKu6hkpVWU2y+RqPLj/Vmk0lJ
	Z1ASo4CutaFyDhJtse1zVgSEP2U9OrrTrId2OTG1GD6QHgfhwY8N5kXEckQ20jX6FRywMP3mx2V
	J+Y7UMn+iAf+6BSS67EkIW4jjByIKJV0pBAr/zVEN1gQhJgAifGU1Ntin+OVt7R5d3FZwsUWVBB
	IT2joVzTySNSiR9hE2oT6+P3Brn3yCziUGoKyW2UrqrWfaPi7MALJJkuWAS4UgkQhqCj9oiBoTV
	La8xNksvH6Xhj8r7s9b+vf5E22Ig1AlXDhPlCN6oO2l9dujRiL8O1FEikROj3Oz9GttglJV5wLQ
	R4ayAsQ7HX2OxfhW9lml3VqYMOiYQFPj2+RKqqLQgHwYYTR3ML3Du+egLpm4GbEYrNMw=
X-Received: by 2002:a17:902:d2ce:b0:2dd:ad74:ac28 with SMTP id
 d9443c01a7336-2e5dcda3da0mr8813935ad.26.1791284991550; Tue, 06 Oct 2026
 04:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <20261006101606.54079-3-phucduc.bui@gmail.com>
 <633be718-a5c5-4e67-b9e1-5d4422944f2a@intel.com>
In-Reply-To: <633be718-a5c5-4e67-b9e1-5d4422944f2a@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 6 Oct 2026 18:09:38 +0700
X-Gm-Features: AclHuK_Pc8LShx91NLSv5hh9JwqBTqHJzVOnbNwPcfyhu5KBMevAfkIzcISxmg8
Message-ID: <CAABR9nEp+-cM921ONe068QQ9OGH5e_+sqTpfBV73xcCCh8uu4g@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8188: return 0 from
 mt8188_afe_fe_startup() on success
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_040952_850100_CC871BCD 
X-CRM114-Status: GOOD (  11.01  )
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

Hi Cezary,

>
> You can reduce the delta by leaving the original if-statement as-is and
> following it up with:
>
>         else
>                 ret = 0;

Thanks, I'll make this change and include it in v2.

Best regards,
Phuc

