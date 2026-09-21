Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF4FC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVCv1PgC81o7TRBD5ycHllg8hQY2X2u55UwafrfWrG0=; b=UlK36GjHVgO1vrFkKyjdloXOuF
	r1aerhpnqbsoKxTf7IlDt8oslXG9+t/GDAeKOlyHIvdtfXppevA9N4GYjA1sa+Yxk3goLW1uZ3GDO
	isxY/dlMp0HekwBzbwd+DhEUwX9K6ps9xcTtUEZCW6M02jKnDrguo65rdwwfoQ4pIMX6Jm8DgQoBw
	jelwM2cTzLFDpr8euXBH/N1NO/St+YmjsU6xMJWo2LCPyhZjhgx43M0lv0pprVFJ6br190JXMgd/U
	e7m4XnLG08ejIHY2O9ZJtufL+i7hTV5Wj1+029PHFz+9Vn5e6PwepnLlXxrnYia63Wg9VVbRePvme
	o2ZHJzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ifA-000000036TU-0fgu;
	Mon, 21 Sep 2026 18:22:48 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8if8-000000036T5-0P0J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:22:47 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469f20513so2763003b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790014964; x=1790619764; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVCv1PgC81o7TRBD5ycHllg8hQY2X2u55UwafrfWrG0=;
        b=bKNqyXerpXwyDMlOF43d992weOpHFR46CEJMTvYW6vQ0Y0KlVnaoo73q+EZsiQcfzA
         I8q0dn2a+dpVH9WhVXpFYSIXppGB4OBrPVJohzNoa1j/B09a0EuhJ75D+80GQh8Zv7vr
         K7gJ/DW3HA7zSF7wOOnqX/eje7uPzRLfqzrnbtdXR6wqK06Vuu/RHn5X4FAJbqjuzmne
         Zw46zfylOX8CO+QgNpXT5BdIC1SoAN+YfC0UgXWxE08EGxaON4WdolPioxqEYvU9o2Gh
         FXGJ+0uMF7mhwe+g5Pdz3AbkVnoa4PFCLxMpgwq67/HomVbJp8GDIhNICaxag1cKFq3T
         Nhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014964; x=1790619764;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVCv1PgC81o7TRBD5ycHllg8hQY2X2u55UwafrfWrG0=;
        b=1+Btm2McHVdTZwPlcey95DFVFvCBkehnDdzpSvXeB6bobHs7wQKBQoY83MlrViKpOt
         X0lzKZ60JIGy3qGHqMdLFBJRUAH6+e1IaeB8uAE0xunA5rtxzZZgB0lVDKOvLcU8PQ59
         XFrP9i3/bhXyNAWtmoV4+Bmbeq7ga1YhVwIRVLGqB9Vto8puTTZ57B3a7yBU5XMisbdz
         O7pZhXcI6qmfHXfXyNDXHXpzy+1FZTUT15lFqAoE6zxCpnwQZTMaopVsK6rTZkFfB2FZ
         rbQDpg6tkF4vpEwkxZski968zlTqfq69q8ljmIf3vXtIWJ21biiTipajwikkrC26hJHS
         ++Fw==
X-Forwarded-Encrypted: i=1; AKwUvByScEt3KWaJl5RvfIN1gm57GeIfKlVAnAG6WcJno7mlzhQS4l9hqGmikrYHJBw98FFb87ksnM2VmHcs3lftk9cc@lists.infradead.org
X-Gm-Message-State: AFuF++kDZ/62Qz389XMGNo798utmSuLVFKSTqyJgdEcbRVOApowu4rRj
	4op/91EIwL+jDbkwNGz1U0CPHIZVeq5OZuInt929HrGS9a5LfOM8/4zimzg9kJ/pSAo=
X-Gm-Gg: AYBFou0Fi/LKtdqa1zjlzhqO2MKDGweN4spk30S0icGKpB7xacKD/NXApoTUlieUVvy
	TIbI87eO6Ifcez/ZGwA2/YbDzX/sx4cOnWQ4XNvUeLkfbyM1VYTDT//CQ42/LekWLrqAX5+nt0D
	RwgoUfBbfxC9Cjc7xLTxaVXsbCJmtsmhc1BY8l2AMyewE8vGGsZCpQMZacHLOHYQ2txBDlSH3rb
	SVn2vnBFMgURxVKHEg0LUh0i8weWWmnkJz/4Bb7KhhOAdQy1tDpk0tsIDjJz94HxKELxQ2Dlbp/
	Jj+PKzS66ioK7JxJIuXj4/jucHtUEkIe47i92UzObfofpFgRdkBWdmfa2mdtWX0B62JSdX8OZCd
	n+ioeBZCeGgmNgmXNRjRYXiMEFtEZS5BfqMOYQdlx/VHJoTr0JlGtyW/eb4SO2hqEAc311m30wz
	TAhpbfX+Sy/KiDBdj3o9BR87Tgy660pnkQBR/ibnjA5w+opfTFGnVr7H4N3TXawKImqk07kyw=
X-Received: by 2002:a05:6a21:7a96:b0:3dd:a00a:c5b6 with SMTP id adf61e73a8af0-3dda00ac6admr12914266637.41.1790014963608;
        Mon, 21 Sep 2026 11:22:43 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3318763bsm19075795eec.19.2026.09.21.11.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 11:22:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 11:22:41 -0700
Message-Id: <DLL7CH0T2EG3.82RGWEDCQXZ2@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Shubhrajyoti Datta"
 <shubhrajyoti.datta@amd.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] i2c: xiic: preserve PEC byte length in SMBus
 block read setup
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.22.0
References: <20260909-i2c-xiic-v4-0-218df31e9d3b@nexthop.ai>
 <20260909-i2c-xiic-v4-1-218df31e9d3b@nexthop.ai>
 <arDgdyG0QsNerDH5@zenone.zhora.eu>
In-Reply-To: <arDgdyG0QsNerDH5@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112246_145406_A016BC96 
X-CRM114-Status: GOOD (  13.90  )
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

On Mon Sep 21, 2026 at 1:43 AM PDT, Andi Shyti wrote:
> Hi Abdurraham,
>
> ...
>
>>  		xiic_read_rx(i2c);
>>  		if (xiic_rx_space(i2c) =3D=3D 0) {
>> +			/*
>> +			 * If the setup path padded a short SMBus block read up
>> +			 * to SMBUS_BLOCK_READ_MIN_LEN for the HW exit
>> +			 * workaround, trim rx_msg->len back to the number of
>> +			 * bytes that are actually valid so the SMBus core's
>> +			 * PEC check reads the right index. Must happen before
>> +			 * the rx_msg =3D NULL below.
>> +			 */
>> +			if (i2c->rx_msg && i2c->smbus_actual_len)
>> +				i2c->rx_msg->len =3D i2c->smbus_actual_len;
>
> We do need to reset smbus_actual_len at every xiic_start_recv(),
> otherwise this would be true for every rx_msg. Right?
>
> Andi
>

Right. Patch 3 clears it in the BNB handler, but the ARB_LOST /
TX_ERROR branch goes straight to out: and never reaches it, so an
aborted block read leaves it set for the next receive.

v5 clears it in xiic_start_recv() and drops the now-redundant reset
from patch 3. Patch 2 unchanged.

v5 also tags all three with Fixes: e4c1ff772e1a and Cc: stable - one
commit introduced all three, and a PEC block read needs all three.

Abdurrahman

