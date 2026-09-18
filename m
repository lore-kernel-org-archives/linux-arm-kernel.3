Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DEDC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=; b=yxLEGQ0Zyzu9lMhmQdLxMp9G+z
	lVeGGneQtUnTBwhO1HPdLyOePzJ7BHZ8UoDmzwlEO6uv7PqeKd4bhEF+YZkOgBsJRjg+S1b0xnCEl
	LJfnZOvZsvdxt4XPh09phpLqkvnLoAtgj01DsbLn4NNMWf6GZZGPmGU1P3nfyj6P1kk2RUj15OmVp
	d48AfvwSDD0u32rcWcZdZDgOJ0CrabaTNPH3UlQ3GNXV2f8CXvnVc33IA3nG9RlTaDdaVzIpVML5a
	sdn0JJYKLmlXh43t2k5/Dy0ijuh2lIEaIym9a+w1ZLa04JrjZF0npZZTiOHJ7sOieQNIOoU5nOUPD
	700MHNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aIu-0000000EqW6-0iz9;
	Fri, 18 Sep 2026 15:15:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aIq-0000000EqVj-3FSC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:15:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDP5pI102302
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=; b=DTqEyIFwhXRJLNu9
	IeYZsHOrKbXijwmdqq+ZxiPvyfet/fCUB0waQ1XFZArweh0RjYYUmoxq7nl/JEN1
	Uy5NmhOd1qusEnfpTpqRg8agzbrAvS7pZSvHR/ylobOfF2XYjSV1/YXA1xxh8us/
	0WSRuT7kO6kdLHoxx0I2EyTlfaVrjEBLOT5OPcRGUnOIkfZCR1Q/Gs7QFtUyIHF/
	pYQtElGkrqyBwxzixxweaHTo1wj2rjXG06RAMMI+IEvfVga5JiRCPKr59GAZzH1x
	JMF+HWQl287jMZVbazg42u8QTxVQ95BPg7psGMdFhgyAH+3PsFf8v+fRdN7V6mJV
	VeUpRg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2kv788-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 15:15:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6f80c76e6so17559515ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 08:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789744502; x=1790349302; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=;
        b=hZp0EwIrMxdqEI1ttTOHMYSwA2GzycAnXcvau2RNmEh90GKVh8svJoM7xadzgoDPeh
         qVcVvbJelLu/5oZkg8s+1thaPR0R97ITgfD2ZBCUaTEEf00rxp0mK99WFRU8xJro0IQF
         /OEER8dIpkcp1rfWPAjNFcWN4O/YlfUgi2Y/JeLUfOJcIhC5A+9VwNIsRuZo1wGqWKTM
         1QCiaRMI2OdcB0LDc58Xk0k2NnMI9M4LCmrlD6WDqWz7/vPgzwzR39UBuYR25x/I9Dj3
         E1Zr7QhatBNAq2kJPPIOOQCZV7zRBttyvhPEU6ErKII0kie32uLApHDjRKGCzrmnT4qm
         5eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744502; x=1790349302;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=klACuV7fdAYuSy7gHXP/AwNMnEDjRFePgshatLjHrOQ=;
        b=oK6ZVInWoFGMgQ6eWOPCW6Ku5qOsNcvGFkX0YPmRkFJFpuURg6ZpEBZVJFFWZvUDRG
         Zm3jMsy4mIOS8OG21sSYZvhOyARS464qChhr8BhdOhC9qikqwSZuTWxbo54tavPFriJ7
         43C0XDStI46dFBv2FJnZxGrEWHxF4jj4C4w5wTa0Q8MwfdwdfR5WBXuPlTZtPAmZEK5R
         AFFBJinkoyuaLmpjI8OOiyEEpk4uYLEc/bcVqOUkQp7etrzMmli7jAlQZFk6qaUve3TF
         jVlKkk082Y6mm+yWV2I6jIMAK1KvNmotqptP/VdXLk21D/XQB+iOsY1EqWLg0jSLWyS3
         2GQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFGsh6hbWYP/sBe3qpecHTfVk8gPthJjmACa/bUWKYfoJLPjhUvuaf4buBbtmC3/89MgiAflQ1n9wyh5FBPm18@lists.infradead.org
X-Gm-Message-State: AFuF++kftPPZY8J9JRh4fYaAEUIr9mmHY7JkthcpC6h9coUyrKCD778V
	aHaYIIACNU3lsqjmuv/tyZ0piijoBOsIMOwc744D4UGBfflQDoOa5+L5ayRUiwqmPv2AXJile7Y
	QRupjP7VzvnoljBcDGgssMgsU0ejioLQms2/9ghQfseoeRqACzaPXm/zy683UlGGcqNnfPSwjLT
	v4Dw==
X-Gm-Gg: AYBFou10talGYB3DPE9HE/YVYfFNJ0plAg2/SM3PRHQAcNGg3Et8K8+xvpVd7IZwlFS
	b6HSAgh31bA5Hdov1Z9yF2YocfptMQogAqBE/ZMwmMBe+IYYuY9ywKXjpJVywvJugSB+CrpoMH8
	8mL8LfTXwN+ji5mcDCXQHa0qP0CmccGGYfSSmWQlRxxK6rU6noyjlA1nE1YwpLwRDVUppc/Nu0b
	Lb29LRokazNuU44MziH1Z8SN1VdX3hYm0fQbncWNNJuky9883BVJm8lPK2xIj8SnNr69l5mbiq8
	YEj9N/9QoY2DF1xjXYNl5b4dGR845NK+5VN3Q3Q6+KUImuyjKbA1hqN3YJYcrLKV95sqoq/ciG/
	HO5obaQ==
X-Received: by 2002:a17:903:906:b0:2dd:c053:e669 with SMTP id d9443c01a7336-2ddc053e6a2mr4634885ad.47.1789744501624;
        Fri, 18 Sep 2026 08:15:01 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2dd:c053:e669 with SMTP id d9443c01a7336-2ddc053e6a2mr4634335ad.47.1789744501092;
        Fri, 18 Sep 2026 08:15:01 -0700 (PDT)
Received: from localhost ([143.246.51.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb73db302sm10267015ad.2.2026.09.18.08.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 08:15:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 23:14:35 +0800
Message-Id: <DLIJGTK5M3G0.2PNROS5SMQWNF@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
        <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
        "Ze Huang"
 <ze.huang@oss.qualcomm.com>,
        "Alexey Brodkin" <abrodkin@synopsys.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard"
 <mripard@kernel.org>,
        "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>,
        "Joel Stanley" <joel@jms.id.au>,
        "Andrew Jeffery"
 <andrew@codeconstruct.com.au>,
        "Frank Li" <Frank.Li@nxp.com>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team"
 <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "Linus
 Walleij" <linusw@kernel.org>,
        "Hans de Goede" <hansg@kernel.org>,
        "Alex
 Lanzano" <lanzano.alex@gmail.com>,
        "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>,
        "Philipp Zabel"
 <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
        "Marian Cichy" <m.cichy@pengutronix.de>
X-Mailer: aerc 0.22.0.r10.g73f20125
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-2-de36e534f7a1@oss.qualcomm.com> <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
In-Reply-To: <8e4c84be-5c89-4d84-adda-aad4c7de0c8a@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxNyBTYWx0ZWRfX5WhwqpcQP4f+
 OlNIkvRuzzuIalAnwguoXuAiRIjihfFWvUG2hZyjCk6fC8zVi5sB7dXVWx/um9/Y+pTGSsq/9Zo
 Vufd1So+wSc3o5Iq11Y4dCbF+yBn4RFJaTnOENJLw/ZvyL820jjeOQG5Fuq8Pz2/atvnFwnDvgr
 wKoLG1m+Ttybx67w9qCVsIA7viW6VSRqQxHxfbYOSvnOtspieC1+V7+exNWYXIKZ2rBHC/3abUt
 bQQV/X/Uo9Gjso+q/qi1C/xlIpIgNKT+yxNfViiDP2FGYTobSxEiITghk5W3IUMXO1jmvR/93X/
 J+rJdeReCUCwA3oiqjvi/Ew2hDplHpZu8kqGa59zUlJKgg/yMwXx8zdHp8uhTpo3nwUpDFR/N+1
 ++fPHNRkf1V9uh4J33giRoQzVa/fZaI6et2BM6OD7wdnV3s4B913eVJ4M2dW/nkfnC17jx1UiN0
 nUtpqjNoczki6ZNfmRw==
X-Proofpoint-GUID: c5lU1D8UXEQ5X9iGP-s5vlZkMfR1o0kh
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad5576 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=LNnhWNgewsfctp/cwirQdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=nI5uWgR6GCbiVoZM8DwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxNyBTYWx0ZWRfX9aceLIRcBtjE
 dpFnunw/4CpFcXCnDveBQeYSHsT552dXNOYgibs9vglgkurIyG4l6c6RLVTraShGG5WudkqXb95
 kIRS3LIbGplJA8z+XKQ0ZhlTRCXMgjU=
X-Proofpoint-ORIG-GUID: c5lU1D8UXEQ5X9iGP-s5vlZkMfR1o0kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_081504_954914_2503C8F0 
X-CRM114-Status: GOOD (  14.67  )
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

On Wed Sep 16, 2026 at 2:50 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 26.07.26 um 21:42 schrieb Ze Huang:
>> Convert i.MX LCDC to explicit primary plane, CRTC and encoder objects.
>> Keep no-scaling plane check and GEM framebuffer prepare callback from
>> simple-KMS path.
>>
>> Wire the vblank lifecycle explicitly with CRTC vblank callbacks and
>> drm_crtc_vblank_on()/drm_crtc_vblank_off(). Use the old CRTC state in th=
e
>> disable path for clock unwinding so the clock reference count remains
>> paired with the previous active state.
>>
>> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
>> ---
>> +

[ ... ]

>> +static void imx_lcdc_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *commit)
>> +{
>> +	struct drm_crtc_state *new_crtc_state =3D drm_atomic_get_new_crtc_stat=
e(commit, crtc);
>> +	struct drm_pending_vblank_event *event =3D new_crtc_state->event;
>> +
>> +	if (!event)
>> +		return;
>> +
>> +	new_crtc_state->event =3D NULL;
>> +
>> +	spin_lock_irq(&crtc->dev->event_lock);
>> +	if (new_crtc_state->active && drm_crtc_vblank_get(crtc) =3D=3D 0)
>> +		drm_crtc_arm_vblank_event(crtc, event);
>> +	else
>> +		drm_crtc_send_vblank_event(crtc, event);
>> +	spin_unlock_irq(&crtc->dev->event_lock);
>>   }
>
> Please use drm_crtc_vblank_atomic_flush(). [1]
>
> [1]=20
> https://elixir.bootlin.com/linux/v7.2.5/source/drivers/gpu/drm/drm_vblank=
_helper.c#L51

Thanks! will follow

>
> Best regards
> Thomas
>

