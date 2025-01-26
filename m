Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6BDC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jan 2025 22:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DdbTStKVkTb7WFrUrJoNlbv7lkdF9Cm9SPJk5oqJFw=; b=spfkvekMDwuOEYTJyt0o0eRhz2
	C4uUmzW7bzfi1cF76n19K8q45m3KffiCs2oZBH3xvpVF2OD8JElcmgZoRQg07/6+gPJCYcdafIat5
	Jh6hGmDrhJqPzm7tRGjUYBqYx2oTMmj9C1dnoRzpXTB7vkH5lq6ABgTkvEdmo1Stj82ypNkD5Zowd
	BXXx2u+SKCN6BLqlTMCeSMcaxvQwTBA8GeGGSOLzcGQqe8u0wrFTXyaYsd1CXDzYWwk/s4LCe2Oi5
	4xxagVHz8f5l76ZTjJq17nR+yaw3KAZagaUdFTREWXL6bBu4NOcAcS486l9rIaf2kwpSHAQiKEtyv
	SIIKsozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcAhV-00000001ADB-0lzX;
	Sun, 26 Jan 2025 22:01:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcAgD-000000019fp-2Nt4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jan 2025 22:00:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43626213fffso30244005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jan 2025 14:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737928831; x=1738533631; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4DdbTStKVkTb7WFrUrJoNlbv7lkdF9Cm9SPJk5oqJFw=;
        b=M9ggIJkwJoXXGD8zf2iFmGLbL9ZwDm3AM7wqeQu0+hgW7Ig5rizkVngvvF7BMs4s+F
         sYA1GKM0HyS4HD6uyFs/8N/Ke40TiaqPG9BSQSDn8V5iTc+58Q6PYm1T7KisDI0iyhT8
         E6Hs9157jNBAX60wsodGngby+btmShPytKavdGzPSIsOyRTTAhYVEgopKVdTvZFAO0qT
         qf6gY5sRFTtahJuc3ATNz50VgFl+FuItpQUDBnhGvrIifYLGQdXY9dyik4c4t4zMALq+
         BziPM4PKQwOigxQldjbibGNENUfntT7/9OGBZs8yG2jwF81ld95fMn4ZdlFU+HOge+e4
         dZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737928831; x=1738533631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4DdbTStKVkTb7WFrUrJoNlbv7lkdF9Cm9SPJk5oqJFw=;
        b=CGpUBjxk4qcQhZ4DXwE5SOi35cTMv61LNiZKInBb2k13t4RV/W6o+ueZy2ue5YigcC
         i5KtcOzH9BNyTMlce9hv8tK1hPjxtUHSXV2u7ZoogV7SclVuHCNc8o0IVtl8rmSoDJeF
         iSMPRfGUe1t6804BJ4fktmNvZC6gkq/bIJZDrwfMi2dV6NdbdoY2TIU3n+w+2I0Jg4Uf
         0NYvyY+neQGN+mCFBpEu3gQprzg+vviguwoM/REMWlEvu15D4RQoD3CmXmyec8Oppev1
         akyl9c15ePTgkike4O8/qRridnmv31YHf4GUK+UEwWBPk3byvwJ+IRSV2LWsI+nJZUE6
         PKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/kBNESM4itdBIDhOusAv9A3rUZNprOfdjEX7/MkCnUHVCzz1e0v1bPGxk3oLXj/h64wTnGjVBiUFVs7iHC/Td@lists.infradead.org
X-Gm-Message-State: AOJu0YyIG4Igxlvyqd25URgqw5a93M70QoIy8Ac+T1SARQB21hIbsg0B
	aG8hENshW3JlLUSssAA9phvD+zL/fPbDF+PQ6/IiwsiBCL0iX44B
X-Gm-Gg: ASbGncu/BkZzySBAUDdTv2pzGrbVJHG6nuqaNaITWc51DTjG/SkN0fhv8z93foupCKs
	xbxQoHF2L2WrGDP5Ry6RMmKDNPoIb17ytp+JuQsjmPQ0pQ7iUf74X6U9dKvewwJ6qqTmBMuRcJp
	sAYswwncOczUexJNtWKFx+Dd4+oCgaeVT3h1jVTmgfCqI295TsCR/zbvPuoEov7pN5q2TKg3YM3
	TkZ6A9saxKTVr5ZznEURPY+oFi+WpJm1nz1jUeBsKCPlgpS2jRAMHqWFyvjtYNvFPzLCjWvE7SB
	lv12gq6T5BEoeiafSCqPHgAheex7DF0xkYwiJ7fEaWzfal5m/6e9XSKnAITIIWsn1Gt9AhtZpIW
	farEu9DjGE1sUs0huKiyjGWH4GqG3kQzFZ9vOInrTdQjz
X-Google-Smtp-Source: AGHT+IGsZIr2STvVAqncSIrcbBNbIGfPo1HDsn0GMZTH13nRBH3HPa/wKJc6AIwOxi8bTdK3IydwYQ==
X-Received: by 2002:a05:6000:401f:b0:38a:8b34:76b0 with SMTP id ffacd0b85a97d-38c2b7d12a7mr8375865f8f.27.1737928831040;
        Sun, 26 Jan 2025 14:00:31 -0800 (PST)
Received: from p200300c5871e95f7cf8ec2b454ca4b5c.dip0.t-ipconnect.de (p200300c5871e95f7cf8ec2b454ca4b5c.dip0.t-ipconnect.de. [2003:c5:871e:95f7:cf8e:c2b4:54ca:4b5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1baf3esm9290068f8f.75.2025.01.26.14.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 14:00:29 -0800 (PST)
Message-ID: <76ddd6b18a35a19d284496345e41f5a22866f171.camel@gmail.com>
Subject: Re: [PATCH v4] scsi: ufs: fix use-after free in init error and
 remove paths
From: Bean Huo <huobean@gmail.com>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart Van
 Assche <bvanassche@acm.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Mike Snitzer <snitzer@redhat.com>,
 Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulf.hansson@linaro.org>,  Satya
 Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  stable@vger.kernel.org
Date: Sun, 26 Jan 2025 23:00:28 +0100
In-Reply-To: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
References: <20250124-ufshcd-fix-v4-1-c5d0144aae59@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_140033_605924_184D3AEA 
X-CRM114-Status: UNSURE (   7.93  )
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

On Fri, 2025-01-24 at 15:09 +0000, Andr=C3=A9 Draszik wrote:
> Fixes: cb77cb5abe1f ("blk-crypto: rename blk_keyslot_manager to
> blk_crypto_profile")
> Fixes: d76d9d7d1009 ("scsi: ufs: use devm_blk_ksm_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Reviewed-by: Bean Huo <beanhuo@micron.com>

