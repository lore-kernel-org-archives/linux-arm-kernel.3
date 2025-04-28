Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB91EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuK7JoVFw4BkBRnm2Ypzhevv3vdRGeuSRVhD+23HyZI=; b=v2p/EnhPsjPvPj2gI/RAFwxKKt
	siOi2VrcRblPB9amOK7VN90hL8jGH/u+6wDRUAkGfnhfr4Ql5oFs1pLpBcr3yEgpaJKJFb5UtY8vq
	+2hzAvNnKpgSE235yd1vMbrrK4QO1y5pH2dhE5zrmWZmR7ibbK3MK+F0n+bS0DOwFot762QlgT0NF
	fa4IJ2zGzPnvWxH88noURvnItw+XPX5pioLCToP/KAhwzp285d6DHWZIIxRYSyAStF8JqCy+Ggl8A
	aZ54JBdR0GkRada4VetMpc17eaqIvbW83nLvZCl5UXnMrbfSLPB2hrSPEJRmu3j/OW3dBGWstPGpV
	b/3jsXMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9N5Q-000000063hn-0FQk;
	Mon, 28 Apr 2025 11:55:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mci-00000005x1S-3jnC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:26:10 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso8852184a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745839566; x=1746444366; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuK7JoVFw4BkBRnm2Ypzhevv3vdRGeuSRVhD+23HyZI=;
        b=orP7Q3VBGM5SR/Hx6z7/Vo2layGIMnDeo5o/0IBD6/aAxnI782UeGsraORXJR8DAvU
         paNxIRU7OpPM/AT05NYy5aqZvjg8k6gSBr7j0L2mmDew0bMIhG5LPCFffePYmZrs35rR
         zUJmnytQx9TPbF9SsjkY+2zjoiSHmTI5I8FskJ+mBjjVlQA5KAZ3hbluYkquy1XG+Sx6
         E00nJmALm8z8AiiZMaTSZZFD7WMkusD1HRiYhXryUl50tiWmtRidifIAzNiOscasgmA9
         GdFyePQ6+KsZa/gqPBdmS1fHQGin+dpJzvqThCLLy/+5vZBEQTdv+KW1Dw04bcfBsEy0
         PIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745839566; x=1746444366;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YuK7JoVFw4BkBRnm2Ypzhevv3vdRGeuSRVhD+23HyZI=;
        b=gswquCJKMNhGHFDr4w61JQugmiTai9qlnqkt9ll9DsxFe2/n5YTof7o5SdEEz05Cic
         wKtIROHNauFqrB2g8DEcajZ2FmN+vZBOl8Xp9XbMI2S6e6VpLSwFiA92my2fR8b2QhBW
         G7PVtK3fWAKnkgVRA3wLmdRYyclo6iWnsgx0sRn0e5FhzYRd3TGKNLKi+yHkGb4zCoxR
         oeG6NzOdJ545VVYPoDe6ONPsMdBsrKqe+jwDL6z/8AUMp5TQWzfgO2MzmyzJH+aX/WFo
         MR5ssy7WF3dM2NbPUk76ik55Bb3lG2sEXSsQ0/2kuMW56yzasvAiROoKZjFG338qeDKv
         gTkA==
X-Forwarded-Encrypted: i=1; AJvYcCX2ayj3ARUB2+5TZyzpheFhdUSGrzJ5OjM7uG0h0LLnAzMDejzabcgsdKMHey4yVAdM/8bpvdjEH+bizLMycAj9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzs1TOrGwUPPLVhWDWN+RLCqnwYH1v6KXJ0cdNpNnQjIkrE7Li
	rgepi3X7XqbPeFeniYqiREMPcGRrCxIYjBbldv+vmb2njvSbY5IgYthkM6bFVUg=
X-Gm-Gg: ASbGncs9N5sFx7twaVSJojFp6hqIhfBU+s68G3YQ18limsznzsKeTJsUxfumcHSDdwC
	EqDbg1rEdzMoqWpk0XIVCRxFBSSMletMdh/l3tf2e9TqlsAvJt2gI2bpl+ANOGs2JZiOz3R02cH
	QAq5aorgYs691hZ7YHq+6mNom9kDZ2iwERBLR/9HSuPZxJTf07LQgFcwv7+wvRxZexraR/R1c0a
	6kywpKxThGTmyDyWnZM9ECfch7gnZHtWJsluEyIZGb0LOIrlpLJdVpTHEdlw2YcVGbMoMNCDh6G
	wGgPVQaS42lu8be38tAtMeq6qIFkwr5MR8uPlUlTjFT91YgBkT/yXXTWeSgrR6TCBWhJPLbVnAE
	iBqY1WKRf+w==
X-Google-Smtp-Source: AGHT+IGT+8m3xK7xabSZ29IvBc7+P0gS4DksBTS1Czdm2SNSBAyYHQHsIegSOcFqAFzVvUJUQUDxDA==
X-Received: by 2002:a17:907:7e84:b0:aca:d83b:611b with SMTP id a640c23a62f3a-ace84aad97bmr827114066b.43.1745839566451;
        Mon, 28 Apr 2025 04:26:06 -0700 (PDT)
Received: from localhost (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6b009sm609885766b.138.2025.04.28.04.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 04:26:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Apr 2025 13:26:05 +0200
Message-Id: <D9I8H4AII5EG.3QKI8U79KC8SO@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <peter.wang@mediatek.com>,
 <quic_rampraka@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
 <D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com>
 <df287609-a095-4234-b23b-d335b474a130@quicinc.com>
 <29c3852c-3218-4b42-bc41-75721a95fccc@quicinc.com>
In-Reply-To: <29c3852c-3218-4b42-bc41-75721a95fccc@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_042609_004280_5EF9AFBC 
X-CRM114-Status: GOOD (  20.21  )
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

Hi Ziqi,

On Mon Apr 28, 2025 at 10:06 AM CEST, Ziqi Chen wrote:
> Hi Luca,
>
> We made changes to fix this special platform issue and verified it can
> fix this issue.
> Could you help double check if attached 3 patched can fix it from you sid=
e?
> If it is OK from you side as well, we will submit the final patches to
> upstream

With these 3 patches applied the errors are gone and I don't see any
UFS-related warnings/errors in dmesg anymore.

Let me know if I should check on anything else. Thanks for the quick
fix!

Regards
Luca

>
> Thanks a lot~
>
> BRs
> Ziqi
>
> On 4/27/2025 4:14 PM, Ziqi Chen wrote:
>> Hi Luca,
>>=20
>> Thanks for your report.
>> Really,=C2=A0 6350 is a special platform that the UFS_PHY_AXI_CLK doesn'=
t
>> match to the UFS_PHY_UNIPRO_CORE_CLK. We already found out the root
>> cause and discussing the fix. We will submit change to fix this corner
>> case.
>>=20
>> BRs
>> Ziqi
>>=20
>> On 4/26/2025 3:48 AM, Luca Weiss wrote:
>>> Hi Ziqi,
>>>
>>> On Thu Feb 13, 2025 at 9:00 AM CET, Ziqi Chen wrote:
>>>> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequen=
cy
>>>> plans. However, the gear speed is only toggled between min and max=20
>>>> during
>>>> clock scaling. Enable multi-level gear scaling by mapping clock=20
>>>> frequencies
>>>> to gear speeds, so that when devfreq scales clock frequencies we can p=
ut
>>>> the UFS link at the appropraite gear speeds accordingly.
>>>
>>> I believe this series is causing issues on SM6350:
>>>
>>> [=C2=A0=C2=A0=C2=A0 0.859449] ufshcd-qcom 1d84000.ufshc: ufs_qcom_freq_=
to_gear_speed:=20
>>> Unsupported clock freq : 200000000
>>> [=C2=A0=C2=A0=C2=A0 0.886668] ufshcd-qcom 1d84000.ufshc: UNIPRO clk fre=
q 200 MHz not=20
>>> supported
>>> [=C2=A0=C2=A0=C2=A0 0.903791] devfreq 1d84000.ufshc: dvfs failed with (=
-22) error
>>>
>>> That's with this patch, I actually haven't tried without on v6.15-rc3
>>> https://lore.kernel.org/all/20250314-sm6350-ufs-things-=20
>>> v1-2-3600362cc52c@fairphone.com/
>>>
>>> I believe the issue appears because core clk and unipro clk rates don't
>>> match on this platform, so this 200 MHz for GCC_UFS_PHY_AXI_CLK is not =
a
>>> valid unipro clock rate, but for GCC_UFS_PHY_UNIPRO_CORE_CLK it's
>>> specified to 150 MHz in the opp table.
>>>
>>> Regards
>>> Luca
>>>
>>>>
>>>> This series has been tested on below platforms -
>>>> sm8550 mtp + UFS3.1
>>>> SM8650 MTP + UFS3.1
>>>> SM8750 MTP + UFS4.0
>>=20


