Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89ADC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRwq5x4VwHGS6JkevscNB7G4mlDeMcL9xsQzNX6TfQY=; b=y+ZrcqU+QrT9V/+weaqcbzDhMe
	7wJQ1IS0Yoqaf5A/ZMTcuBA6DgZFuusU12kb27k/9a1/9rAheEXhK4j4Sbw6zPNJlh0vpBwVyMUG4
	O6hQ79OLLAA+MiGZlAddPxzQqiZ6LCM9sIoUVVTtadbaNbMf7OPsFFwdeZ4nglQCIU2xZqwnuzl+G
	3WxUqrrKEYwnxd/cJObFhTwhF6OI6Ag3jLvwekKX8AoUaDuUM85wRNsqutnx9+YhTcpHXxVKlUEAY
	NrleK2SCRsa/8kavWKT/N3ZwKzuRXK3SYjQohuLL1/k6/jIEWFTXq+JpD5rl+0AMlMFKeWPwNUUbU
	QdNvzCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPdC-00000003HKQ-0wQS;
	Thu, 31 Jul 2025 09:31:22 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPJ5-00000003FJV-3aWg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 09:10:37 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3322a34e84fso5231921fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753953033; x=1754557833; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRwq5x4VwHGS6JkevscNB7G4mlDeMcL9xsQzNX6TfQY=;
        b=eyA1jujh7UT/t6v55I8pUJESiPfix7viQuW/ZHL24ArrTXBuX7wfnfLQq1SPyWEvWN
         al2LFFg9qmV/ok6JRTi+1YQRQeT8DZXotLjQPizWUmXTOEwcGwY0zeP1y85Z0QDGuRuc
         2v9emmfpR5K0ABeR72z4FkwEPPp6XbhxoyQcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753953033; x=1754557833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRwq5x4VwHGS6JkevscNB7G4mlDeMcL9xsQzNX6TfQY=;
        b=XxzkipxbIynACMK6t6iVp4m0uwOBPE+OSTUqqIvoCuZ/sxaj/DQMigmrgxiF0cCtin
         ai5/LffinioYpwvYaLPbuECdjVleQWc7TfMw2qNtJQKrLvHhwf6GO7gnBoIoW5i6h134
         doXynBLz1Er/xPj00wYi8wDVYWPLgvdBgXE4MjIYFmb4IHq2OQIO+IR/eDfUrM7ngDC+
         dMvrIN4BniTtqhDsfyWXS4QMeVLhS1Dqd5L3Em7/CXN46mpi4vyIavcTTybjIYnEF6af
         mkfsbE50lgbaWgMT7qVxKAcPhRcyE26lTiW7/P3kgXR0pLX3TuLVMTEb/WzT9rJjoZhi
         Jafg==
X-Forwarded-Encrypted: i=1; AJvYcCW0J7Gm1pwJUJJunivJvDtYPca6bOwbtE8jZ0Ya0PKcLoBJFpVvhGm+znrDQKbqL1Ueqp5YyTywoEwdSq9i6JGb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6bQfOvtIT0rTmxun1kLPQpt0bnuSzwY7iMO24DS6IICkoA5Uk
	49keKRGTwmnq+inslI+66N9WYcjrqo7xi+xmdAhUHBTUpYHz4UIWoaLSiX7tzn2wcXfDQxzumLX
	j/Zb/NtZ2rEJIP8VoYMOnCyVoNDj+sLFp3YsgWjJM
X-Gm-Gg: ASbGncuo98RSs2KVUNz4g99MglRAw1NOvtxvvsWir/I0d/6LV0n/zQLkP1oC3e3H9M+
	kl0a2LA0vHreW03JIcrdlfdACRPZePIq5lU5PAYAMmiwrHAvJb904NGKpvdIh30kQm1wSG6TVVW
	4V0q6nutTI8E+tqkAFOjvLMaFL34zKfdFXgxzTi/bs/IonGhFKF6Ll5nWQsVwBMsj1k5xbr3h9n
	AGPUKa7QLSYVv+G6XIjIQLh3OPG5zoHqOM=
X-Google-Smtp-Source: AGHT+IGy0Gr0CeJFqOAF9pederTnU2rsst1o/T1ozFpoxo2U18QbJElG5oX2wY8idW4WJNxX3lI94NTcxLdGpZxd8nA=
X-Received: by 2002:a05:651c:554:b0:332:1720:2ec7 with SMTP id
 38308e7fff4ca-332248beecamr19682921fa.0.1753953033319; Thu, 31 Jul 2025
 02:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-6-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-6-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 31 Jul 2025 17:10:21 +0800
X-Gm-Features: Ac12FXwCRD80agK2VpVTgVXGMFnqiS6tk-7RfCAqmaHj7sFRHCdDG6ywSscGSLk
Message-ID: <CAGXv+5En_Yxy1BoWWTsQPSLYCqvd0_r-JCtEByan9xNU0QLmDg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] thermal/drivers/mediatek/lvts: Add
 lvts_temp_to_raw variant
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, 
	arnd@arndb.de, colin.i.king@gmail.com, u.kleine-koenig@baylibre.com, 
	andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, bchihi@baylibre.com, 
	frank-w@public-files.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_021035_919778_73E7D6C6 
X-CRM114-Status: GOOD (  10.00  )
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

On Wed, Jul 30, 2025 at 11:22=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> MT8196/MT6991 require a different version of lvts_temp_to_raw(),
> specifically the multiplicative inverse of the existing implementation.
> Introduce a variant of the function with inverted calculation logic to
> match this requirement.
>
> This ensures accurate raw value generation for temperature
> thresholds, avoiding spurious thermal interrupts or unintended hardware
> resets on MT8196/MT6991.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

