Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE53CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3eh+eqPsqcE5YvVl5FSV9uki97nCFfIXkAkKL28Dxc=; b=GyBk2M/BDUns7SdKLaIOdy570i
	heT7I1VGTGnWVaWdsoQbfdgtTpdnVgRSGI9jlGRsZX2m3EmmF/osIZdfpDrIXd0moBMp6R2UEngnp
	hkxyNPMP1g30OK9OPu5CBUo//5kRhiOHD1CvPYJ4x3o7onzI12s86j/BThluA6XrQ1DhRp+05U6bi
	ZM71Cglx9fC8w6VdcnONnVYCPMJUtThzULNLOgkXy5eGf6DZSh7xOGTsGwqJrV/DU93pxr3pIKAlz
	jgf06X6ocXb/1WumPJVKbQfKmovzbvw41xvsdmRDnGTku99/3au/xPEJw3xUyEhH4tZFdZCWarUOF
	MoocB4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEph3-00000004aME-1cCX;
	Thu, 08 Oct 2026 15:06:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEph2-00000004aM8-2pbF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 15:06:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E7B340250
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 15:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821B31F000FF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 Oct 2026 15:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791471959;
	bh=M3eh+eqPsqcE5YvVl5FSV9uki97nCFfIXkAkKL28Dxc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JZye8FHsMGO+Vhak768IyEeJ7EKz1SQUH8yovlQE0RC+CJfM6kyzx7gtXKzSUDJtT
	 lw2phsBV2qzm/emoM9GUXUs1ZAz47wNKvWCR2GPMGq4q5G1j7j+UakCqBZp99h0gNk
	 Ta6y2LRBQCiAoWgMqMl5iCXq3ajFAEhyuxLRkLtpeYqaK4gYaLaaGEcr399vTsDbl8
	 O9n9wvIoLO2y6U7CA5G5enfSsELTRPH/H3wVyeDgK9UMyLU2WK6jGLe0auIXpE09PM
	 lctSvIo87BT3yzTrAzGAfD6rKrK3J3LQI8OX7NX7UaWwdncf50p2bDlEO8oR8pwO5G
	 vgWtxHHI6waVQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a9787a156eso23887331fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 08:05:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjx9Ujd4uYxw7azrfturndEe4WbGKhqpi1ukQUmbhEvQqhXnvKPoCaPjaxM7XxVbi8wYQFaAs8YarjAZ6ajt46@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3JtxhFuc1am7FD3qs78YGPeiurbxJWPNEayOnU0X3uuKy10dO
	U0caZp82xIYEZaG82ptzYD4qncfCuKDpqPGV8gwQ/ujkffWxAUBQ6pZ2etshnnJ/nCog0jcRZjc
	Mw9pqFYfNCdHzSudVk9x6fCkeWcui+++oeYNJ+YPQnQ==
X-Received: by 2002:a2e:b8c9:0:b0:3a6:95a:52a6 with SMTP id
 38308e7fff4ca-3a9a2d0dc0cmr14079951fa.20.1791471958269; Thu, 08 Oct 2026
 08:05:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 17:05:56 +0200
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 17:05:56 +0200
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
MIME-Version: 1.0
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
 <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com> <CAD++jLkPeEQN07Qk9RrmxkRf5EbMmnuwdq2yBFccwM_QpvjsLw@mail.gmail.com>
Date: Thu, 8 Oct 2026 17:05:56 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdTYic6qG+gnnOExXWhfgbjygi-hR0Rr-FKVAhBkw1C8w@mail.gmail.com>
X-Gm-Features: AclHuK_vfKWdSTRB1YkJ3uHKdqAfTiQySmCCqB7eRtdQW3xirznTZ4Z9gYURvgY
Message-ID: <CAMRc=MdTYic6qG+gnnOExXWhfgbjygi-hR0Rr-FKVAhBkw1C8w@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
To: Linus Walleij <linusw@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 8 Oct 2026 15:11:31 +0200, Linus Walleij <linusw@kernel.org> said:
> On Thu, Oct 8, 2026 at 5:12=E2=80=AFAM Hardeep Sharma
> <hardeep.sharma@oss.qualcomm.com> wrote:
>
>> Hello All,
>>
>> Both of the following patches are ready to be picked:
>>
>> [PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and
>> size cells
>> [PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC
>>
>> Could you please pick them ?
>
> Missing from the To: header of your mail: Bartosz, who actually maintains
> Qualcomm pin control.
>
> This is likely why it has not been picked.
>

Devicetree sources are Bjorn's territory. DT bindings should have probably
been sent separately though. In any case, we're at rc6 now, so that ship ha=
s
sailed. Please resend after v7.4-rc1 is tagged.

Bartosz

