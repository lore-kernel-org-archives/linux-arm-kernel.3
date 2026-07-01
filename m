Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB60EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgX47RXdJZ0KIqrYqTZV9oy3dGtbSHHIqUStuXB2M/E=; b=xmrDiEO2BV+Nqcc6/rF682cVJY
	hPhXZnTQsxbm3EwvhBB+eT4H2zwDNsaoaME1z79IhZ1k95r02WFusEzm05qw+1u7MyBwoSquoSxm6
	ru118lsgXsgrIKN+T0YIM71I+pJSTIyP90az3Gs0eIzkSdEqDvUKRjBcUI48I1xDoGhsAtaeGBAM3
	Wh8UXxk23akLzEcVyPmn0k9eOTgjK7OxaAkS9P8yVl14w8FfJKeWYzu/m14ss/IOD8LtTRk+PYREP
	dL0j8b4cdQZsTfWAfAuE5AdVQu9oyD7zIhH6YEqhdz8YAKKE3oz+65a+bNk2iDSSRm3asGkxPm6XX
	0ORasb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weriW-00000001FwO-2w8P;
	Wed, 01 Jul 2026 09:58:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weriV-00000001FvG-2i0B
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 09:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rgX47RXdJZ0KIqrYqTZV9oy3dGtbSHHIqUStuXB2M/E=; b=Rl9Szjrp9joZlg/MxI/uP71dms
	XLvTrQztFrq/qCOx2YO/su8fcVW3X+Zqe6USR/tUY3qzf41SpJpuaIoidYcOs8FpSWyw/FeqoXaFt
	U5LoXEjJjr5dMnrjVMC2z2cRZUjYzMxlsmWN48Lyt9hZrDrEIJsQSQqj6ZymChHNxrh+kZMeqQFYq
	HMmM+7JFajHLQB5fZBpFhF1M+ZZq75lpy2ff8tbEHiWlompRTkKGXh1h9ytnnyszWFSp6bjOax+8x
	b/mPCo+pSHGphrWx9d58l8F8ODcKLFAN2p78EtvFKG/jVfcEkXGkKwfJ3Bz8p/S2N8P04oDyi5ne5
	+MRlGKpA==;
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weriS-00000002al7-3ljW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 09:58:50 +0000
Received: by mail-pj2-x04.google.com with SMTP id d9443c01a7336-2c80ff1bbb1so1616905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 02:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899926; x=1783504726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rgX47RXdJZ0KIqrYqTZV9oy3dGtbSHHIqUStuXB2M/E=;
        b=dsS+13DAkE4dw2vtmP/5V3pufCxUYdxJosyPzZ42+UoJpGrYeyNfSihe6ILc7PH0Qc
         VN5I7l5vAKzH7XJPHrJQbw/paHGrvgJbVKOpjsSMwn9FU5EwGbM2VpjqvajI0E3g4rrV
         6rBrOy9RrF4nB/IrKAUcmj+4uoTbD3SaZ0BTRJ4QgIxA87SrEvfY/8MiC70ZcFNLaib5
         9+58UCGM8qV94NGNwYt6WijioxZtLoFLyC7uLD4vj9/SCuvjWfAgCVT6tv814+Dx72co
         1uZkWPWANAVPUUwQGBGRz9t5LXsMdxsJlCY5L3+CMVu3RppmQL5w3QoELHy6P40qB1MP
         zAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899926; x=1783504726;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgX47RXdJZ0KIqrYqTZV9oy3dGtbSHHIqUStuXB2M/E=;
        b=jRdGxxOlw4eKXOD9RnZ6jNPiygbaUjyXgJxkY3TVAf1H8oq6Avs6rLz23sgWUkbvIN
         FjkFp2wpG9ixOA68NKeM/XKnyDkFjmdDeq2fk2yEFuLkE6EHBf/ymt621wXsAvrw75pn
         UB+GneAupxiSzEfGaMXMePD2zV7cy0N+TFXNdkPSz3oETr7ypjQ64R1zsaH0s1qkrmbC
         EVK/SLozvRkSF1fajn1OIH9ymi2GcxWbYUcdTGvczKiVhZOueWSqSSPG2aPHzsptcblW
         TUDWxKeDReM5x9S7bkdrI7oxQqxXt9Ohulu+mBeCgva2myURDU5lZejA7DjX9H9BNGqw
         M/Yg==
X-Forwarded-Encrypted: i=1; AHgh+RoDIBYe0/Zrq+bVlsZU9D6KUZl9h6ltoAzqTEX0fdDcArFIZjiD0w2UVEaySRwBnJKjD4gmfnIukiNXuuc8XMIo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd7fl/F/r9QrQp9a/lKxHMnWca0zNtwQIl1EAlpiwdQMh2w5mY
	8OQLbij372a8+KQX5rIXlJGq+Ok0owlDepZApIUgO1ILhcC+QbpBvDag
X-Gm-Gg: AfdE7cmAA61k+6F1QLF3dmJ++pLKlqUFjOFsXTRfpHNHcA4JGVQtlgsb9hC99lCXSyY
	E60Q7ToSfUX2ChlJmKrg25rrO9MDZhh84j4T8ck0AUxUpX3Vach9AyWVGF69P3/LNgizf73HKMA
	lX8szo+wk7T9JgJgrg/ddnmiiT9zgF0Y2dVYygwnV8jLejWI8CoKTEgs/VfPOAlOMo4cMjBkSZH
	foMQnAGID+5MB0h7Tz40YGJHLU4T7ErNq5k4voNs6HBrHCmbwu9StdKBLx0kS6tQ+faY6/PrAL+
	/vqrGSrnEgkyfxdW8NF+IoB9XCYTyS3gpbXVB2XXimI73t0eg6h5NXiFKcC4bPjWy23uGCzl3he
	jWx11mctrFMT/wqdGfAez09hvsM/eCXIa6XeoV9SH9COA6bqfX4qvvTzex+E5a1yjhL3uczX43O
	6ndiGQBzCRj0WWLTFm
X-Received: by 2002:a17:903:46cd:b0:2c9:97a8:8c17 with SMTP id d9443c01a7336-2ca7e8c6253mr10964195ad.42.1782899926244;
        Wed, 01 Jul 2026 02:58:46 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2603:c024:0:1f00:233::14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382d0d22sm29144285ad.80.2026.07.01.02.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 02:58:45 -0700 (PDT)
Date: Wed, 01 Jul 2026 17:57:33 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/3=5D_dt-bindings=3A_arm=3A?=
 =?US-ASCII?Q?_rockchip=3A_Add_Graperain_G3568_series?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260701-reliable-dodo-of-tolerance-63cc8e@quoll>
References: <20260630153810.3574714-2-coiaprant@gmail.com> <20260630153810.3574714-6-coiaprant@gmail.com> <20260701-reliable-dodo-of-tolerance-63cc8e@quoll>
Message-ID: <7A7E4706-D4D7-48C6-87ED-F1F7B4DCE0F5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_105849_010749_5603CBAA 
X-CRM114-Status: UNSURE (   9.66  )
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

On July 1, 2026 3:07:03 PM GMT+08:00, Krzysztof Kozlowski <krzk@kernel=2Eor=
g> wrote:
>On Tue, Jun 30, 2026 at 11:38:11PM +0800, Coia Prant wrote:
>> Document Graperain G3568 v2
>>  which is a development board based on RK3568 SoC=2E
>
>Broken wrapping=2E
>
>Best regards,
>Krzysztof
>

Acknowledged=2E I will fix the text wrapping and clean up the commit=20
message in the v3 submission=2E

Thanks for pointing it out!

