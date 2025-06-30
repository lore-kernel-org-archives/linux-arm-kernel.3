Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156BEC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 10:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91/ZncbDlmcGCt22EAMRhuZKL6uaG/hY8UyZ2Q+pYCo=; b=ve7YDz1LuKTDorB86tnmvgCDPX
	/MxZolxYALA4OMs+46EzS1f4lCLbKNmaEWWJD0C58wsGqtApu3PYTw+JFzaphWUSSzYrf30UNRT2i
	yikDsFnPX9aZryakKADpPY6QQNcNmHF5cvk3hF2hhGYCBSePuEIRYcGXvkVWlMYp8kLGOKOMBurhe
	eV5TwsG8Tmckw+1EfDZ2doh61LUAMM5jqJxuVTTMblUvIhx4G2BDz3cEnRqlJXQ/z293AiLTWFzbw
	58ho6JuoWzAcpXSxMna2S2M4piA5Zek/wYzb0wBkLO2jNjnKaTaBt07/X5JrBKIr8U9zn7r/NGZyO
	K1da7ifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWC5Z-00000001wYg-0NWO;
	Mon, 30 Jun 2025 10:50:17 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWBds-00000001sGj-2sQ6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 10:21:41 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso3269538a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751278898; x=1751883698; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91/ZncbDlmcGCt22EAMRhuZKL6uaG/hY8UyZ2Q+pYCo=;
        b=X++1J58Gd3hEx1RVS9k2oDYMIPwHxOVoEWZh7RW4EB8URHhQC1k/3ox2B8Rigl1O2E
         wxRrswrNHx5B3obkuenhRUChAsGOykTotn9/FWQoYsY9b9eiq/TdK7mq7xqHt+5Pe6s/
         kUPQD0rwLgLx4BAmOlw6Q46WFR8WlhMBVtyo498ubWAhygbFfXjWUU075049WOa5q+EY
         LK58sykeiDSsm2LjieiGYkvwECb3FSgJjengk1Z1Q/c0nkXPyuV5GP3QoOlMn7i4uz+E
         rY8oR2p4/cV6QLsI5Bs6OlSJcMVm0FIcc8gNvu9dtV4Q753a6/zZSrjUvwumonJQQ1zY
         WoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751278898; x=1751883698;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=91/ZncbDlmcGCt22EAMRhuZKL6uaG/hY8UyZ2Q+pYCo=;
        b=RAlL91HuZZSgiFHjtglrcJqud9dGiZUFAPhCaaLCBpAv0u+upF6ARO4CIJ4qD6JbUx
         P8wRCVPLuKmofN5oUgmyQIbL42h0e9ss8AcS3HiDnqUdwqz0gONNKHUd/+H+Za97oc2H
         mMXEZxKfTZ1k4B2glUHynUUsPHHO4X6qYgIE/v4csbp3S88LsmkOSCnsO5jWb/3bFmPA
         Qgu+Os+lE+fb0X/TX0J0hbj0H830Wxg76C/vL9VJZzNM1Ce/Bm5aQi8s4Nfm/fzx4zFx
         VFAWTf/fyPis2Xa0WqVaRDMl2haGIq8P8rliMq7hU3fB200KjyHgIH/TC0C3EBVJMzYY
         7Pzg==
X-Forwarded-Encrypted: i=1; AJvYcCXB5ni1hivDMnpK6m4LQ09YSUUqCg5YWP72chxCAvK0PAOLYsPx6pRhOe9034U0k/mIuXzZNv5Aceq9liQ+9+uI@lists.infradead.org
X-Gm-Message-State: AOJu0YzPtxyAmgIanJzkfx07p7eC+EwGnADteyWz6EEI7udBJBrZbJNr
	EXWMo3NevfPayPHyFRAqsTiWs0Rp20RrfwYq0fi1ckGYkfx4mb7Lf9B+qpxbMH4z11I=
X-Gm-Gg: ASbGncvuSwgRXAqa7Y/N1TxMrt4lJtOMq7oeT72uBvWjkrSDMMKZSyk1a/Y1FJJ9Ngb
	33gd+MrFJYGoVpL16n+0d1PiCxb/BLJ3KkGJ99DnXwypi3x11yhieIjL+KT1iWEj3fjiDVZN2gU
	9faiopKJHRzjKo/l2DVjTVnANZFU4y3kdbiUl8ONON6AgnEvue0gWMJGwKIqImHAvcWfjswI9kq
	rIDy/QUU9vDnRdLAxIXowNSxqe1sRk/1LvxDvJeXuUh52/ZRAvXbSeJvnki9qJGlDWt06Qs4FjY
	j0/aMIV4VOAMHPKD4ZwAdqgaj4P1eYAZwm90iAjNRmNxIUnT6Zn9+HVQL1NAa8R9vncT+Ov2VgI
	ejaTBM9HD+ga79U6e+CAhtxmtYqPkCuNo5gzHBjGSNwEa2SZ672qgw8AB1zZiBvUcsv86yXk=
X-Google-Smtp-Source: AGHT+IG0udIx5/vSjab4jTXQgQOixHxgW8J50sJp+ilVqsU6WQ7uEmPrf6nFFV5tvDzy3dhkra701g==
X-Received: by 2002:a17:907:9691:b0:ae0:c6fb:2140 with SMTP id a640c23a62f3a-ae3500f374emr1085087666b.32.1751278898278;
        Mon, 30 Jun 2025 03:21:38 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a95esm649858666b.59.2025.06.30.03.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:21:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 12:21:36 +0200
Message-Id: <DAZSK2NT6TAT.1N6A4I8ETH92W@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 14/14] arm64: dts: qcom: Add The Fairphone (Gen. 6)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Will Deacon"
 <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel"
 <joro@8bytes.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Vinod Koul" <vkoul@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Robert Marko"
 <robimarko@gmail.com>, "Das Srinagesh" <quic_gurus@quicinc.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
 <4200b3b8-5669-4d5a-a509-d23f921b0449@oss.qualcomm.com>
 <DAXA7TKVM4GI.J6C7M3D1J1XF@fairphone.com>
 <6d4e77b3-0f92-44dd-b9b0-3129a5f3785b@oss.qualcomm.com>
 <DAXEA131KUXZ.WTO7PST1F3X6@fairphone.com>
 <3fbae47b-d20d-426b-a967-b584e32b8c6e@oss.qualcomm.com>
In-Reply-To: <3fbae47b-d20d-426b-a967-b584e32b8c6e@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_032140_739996_CE300C19 
X-CRM114-Status: GOOD (  18.37  )
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

On Fri Jun 27, 2025 at 5:34 PM CEST, Konrad Dybcio wrote:
> On 6/27/25 4:44 PM, Luca Weiss wrote:
>> On Fri Jun 27, 2025 at 4:34 PM CEST, Konrad Dybcio wrote:
>>> On 6/27/25 1:33 PM, Luca Weiss wrote:
>>>> On Wed Jun 25, 2025 at 4:38 PM CEST, Konrad Dybcio wrote:
>>>>> On 6/25/25 11:23 AM, Luca Weiss wrote:
>>>>>> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is bas=
ed
>>>>>> on the SM7635 SoC.
>>>>>
>>>>> [...]
>>>>>
>>>>>> +&pm8550vs_d {
>>>>>> +	status =3D "disabled";
>>>>>> +};
>>>>>> +
>>>>>> +&pm8550vs_e {
>>>>>> +	status =3D "disabled";
>>>>>> +};
>>>>>> +
>>>>>> +&pm8550vs_g {
>>>>>> +	status =3D "disabled";
>>>>>> +};
>>>>>
>>>>> Hm... perhaps we should disable these by deafult
>>>>
>>>> Do you want me to do this in this patchset, or we clean this up later =
at
>>>> some point? I'd prefer not adding even more dependencies to my patch
>>>> collection right now.
>>>
>>> I can totally hear that..
>>>
>>> Let's include it in this patchset, right before SoC addition
>>> I don't think there's any pm8550vs users trying to get merged in
>>> parallel so it should be OK
>>=20
>> Okay, can do. Disable all of them (_c, _d, _e, _g), and re-enable them
>> in current users? I assume there might also be boards that only have
>> e.g. _d and no _c.
>
> I suppose it's only fair to do so, in line with
>
> d37e2646c8a5 ("arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360 separ=
ately")

Sounds good, I've prepared this change for v2.

>
>
>>>>>> +&usb_1 {
>>>>>> +	dr_mode =3D "otg";
>>>>>> +
>>>>>> +	/* USB 2.0 only */
>>>>>
>>>>> Because there's no usb3phy description yet, or due to hw design?
>>>>
>>>> HW design. Funnily enough with clk_ignore_unused this property is not
>>>> needed, and USB(2.0) works fine then. Just when (I assume) the USB3
>>>> clock is turned off which the bootloader has enabled, USB stops workin=
g.
>>>
>>> The USB controller has two possible clock sources: the PIPE_CLK that
>>> the QMPPHY outputs, or the UTMI clock (qcom,select-utmi-as-pipe-clk).
>>=20
>> So okay like this for you, for a USB2.0-only HW?
>
> Yeah, maybe change the comment to something like:
>
> /* USB 2.0 only (RX/TX lanes physically not routed) */
>
> to avoid getting this question asked again

Ack

/* USB 2.0 only, HW does not support USB 3.x */

Regards
Luca

>
>>> Because you said there's no USB3, I'm assuming DP-over-Type-C won't
>>> be a thing either? :(
>>=20
>> Yep. I'd have preferred USB3+DP as well since it's actually quite cool
>> to have with proper Linux. On Android, at least on older versions it's
>> barely usable imo. Can't even properly watch videos on the big screen
>> with that SW stack.
>
> Bummer! Not something we can change though :(
>
> Konrad


