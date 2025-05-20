Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2C0C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsWblo70W25KLjzab3RDQK4+FjMs+JwITco0BGNeUJc=; b=HzgsZmp/c2lk/50pDDHM/VD3U4
	K5hIsKfgdWfSdnU4fQfoGrtEjIqQS5mkifYChA1Mzex3m7g5A9PGnjlzJp1TOXHp9K48BManxHEAO
	NifWd+U6zmXTw8BeIxYpTnWeXXdtK4CUeU/qOyyIslP7d3tlYyTE/WYmfzVDW/aOOZHY6GPJ5ITCI
	2GqeIYotEMVJ1SVonTGDvG9yQCBnH+RT7oTAG5Nz1mOxv11tx5xtyuokh1UkUn5Eq5vTwLbfKiDmP
	oFwPnTfJK1+21YDUrrnQIcBqYzrFldSPgaKIgGPAA4p/7P+i+YU0s3UVvOzknie2bMPY6kBE1DwIO
	qVCGnbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTVt-0000000E4pJ-1MTv;
	Tue, 20 May 2025 20:24:37 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTTj-0000000E4hE-27MX;
	Tue, 20 May 2025 20:22:24 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4b25ZQ3hKWzm0yVW;
	Tue, 20 May 2025 20:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1747772539; x=1750364540; bh=VsWblo70W25KLjzab3RDQK4+
	FjMs+JwITco0BGNeUJc=; b=pBIR+Zvh4Q7rLh9RZvGG64FHSWIbR18L0w0sCyiM
	btVI41klJaHxTtmoaFZ6deEOiM4BBh/9lMca/kD4klUMO1jrxUUspO1xf7FKxWOZ
	7BiZxUpK1YolQgYDd47Xpo61TBOTzc0Rb/J9WhyCu+9ht7x0VrOc8lpQUE6iSCqi
	I1xit/mlup5HSQCdSWhXFffbAt+mIoI8CYgvHAuerAuMSh2yNU/GjK27St8Sqpz3
	U1ZS/0A6QluC4E3gwz+7+hVgZbJUcPQHefRU8Jr1aq8pg24Cwx6LDqk+KIVH5YvT
	f/1Bxnb9oiW3DoqWwusNrFo267n5iMO2RbE9FC+PSzvzbg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id g1LDX6Kg9hux; Tue, 20 May 2025 20:22:19 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4b25Z71qClzm0pKq;
	Tue, 20 May 2025 20:22:05 +0000 (UTC)
Message-ID: <b0ec5b8a-b303-4e5b-bca9-4524eba9fa31@acm.org>
Date: Tue, 20 May 2025 13:22:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ufs: core: Add HID support
To: Bean Huo <huobean@gmail.com>, Huan Tang <tanghuan@vivo.com>,
 alim.akhtar@samsung.com, avri.altman@wdc.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 peter.wang@mediatek.com, manivannan.sadhasivam@linaro.org,
 quic_nguyenb@quicinc.com, luhongfei@vivo.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: opensource.kernel@vivo.com, Wenxing Cheng <wenxing.cheng@vivo.com>
References: <20250520094054.313-1-tanghuan@vivo.com>
 <32c36b58dcdbb09403fa9dccff28b6bee76882e0.camel@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <32c36b58dcdbb09403fa9dccff28b6bee76882e0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_132223_618669_890C9369 
X-CRM114-Status: GOOD (  10.02  )
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

On 5/20/25 9:01 AM, Bean Huo wrote:
> On Tue, 2025-05-20 at 17:40 +0800, Huan Tang wrote:
>> @@ -87,6 +87,26 @@ static const char *ufs_wb_resize_status_to_string(e=
num wb_resize_status status)
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>>  =C2=A0}
>>  =20
>> +static const char *ufs_hid_state_to_string(enum ufs_hid_state state)
>> +{
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0switch (state) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case HID_IDLE:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return "idle";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case ANALYSIS_IN_PROGRESS:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return "analysis_in_progress";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DEFRAG_REQUIRED:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return "defrag_required";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DEFRAG_IN_PROGRESS:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return "defrag_in_progress";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DEFRAG_COMPLETED:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return "defrag_completed";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0case DEFRAG_NOT_REQUIRED:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return "defrag_not_required";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0return "unknown";
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>> +}
>=20
> The enum ufs_hid_state values are contiguous and start from 0, maybe ch=
ange switch-state to :
>=20
> #define NUM_UFS_HID_STATES 6
> static const char *ufs_hid_states[NUM_UFS_HID_STATES] =3D {
>      "idle",
>      "analysis_in_progress",
>      "defrag_required",
>      "defrag_in_progress",
>      "defrag_completed",
>      "defrag_not_required"
> };

If this change is made, please use the designated initializer syntax
([label] =3D "text"). This will make it easier to verify that the
enumeration labels and the strings match.

Thanks,

Bart.

