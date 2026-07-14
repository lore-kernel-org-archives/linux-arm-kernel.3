Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B19C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7sgG5t4VAWsPS+3OEZSVq/ziRSt9Wxqgo9E+hRoh4M=; b=PvNVDmdNHsV1MJbFuqwxy+c+I6
	6R5jRJgrT/omhchgHYGqX1JJJ5nx/BsCTZrLtsdR+igjFVxQC9ki639Mgq/gA5AdrsVLHNllMK+tB
	tMJpMdjVkXydvT1Whl32Yp3sIgMy1DCT7jHeAM6iCbF5wufwgsZV6P9rNDBoM5nN/ESa7/nJqPt7z
	kqqN2xHPofC2c7ZmipK1dwYVodaaxzBhfNueNwNbbJYglWHvGyiJWhtowrb7AmZzyAPRlMbKa7YBb
	8823z5SkDt8DCC39neeFuMmoRn7haakSbXOenvYs28v40PCFor6BEasLbaCQwVO2+B5qfsJDOYWkI
	gl519tdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjR53-0000000Abg5-2ZLN;
	Tue, 14 Jul 2026 00:33:01 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjR51-0000000Abfj-1Llq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 00:33:00 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so2643972a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 17:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1783989178; x=1784593978; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D7sgG5t4VAWsPS+3OEZSVq/ziRSt9Wxqgo9E+hRoh4M=;
        b=foUCTVWeZwJY6cJWWbs6Xj4zTJIqbdO9LhpgdGKNuTGrsMTm0CaUgeQS27WkxFmaG2
         SrEWwHd6Ifta0QZHqzwpBg6jLlgPf2tGWCnFqPHLdLq7+ston/49hGsU1LhzM26MDX38
         FKOWPOxwpNglakHRELYa7gz1yCukB6XN/XQn0fJxTnSP9Lsw7pDqkpsoP2bfNiHOPYxF
         LWKC/VGKkTpK44ycPyJxpHgLmwFlIxzkY9l7vBwZnybO4Lz/MvN1n+XjckcgsxJvi/cU
         xe3xFdY6prI1VuvJrak98KrOclDh4whHrrAGACNJVfvJeBONAd80twi9pfNBJQWn7Qg2
         NrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783989178; x=1784593978;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7sgG5t4VAWsPS+3OEZSVq/ziRSt9Wxqgo9E+hRoh4M=;
        b=raOo7x/FZojr40thxrkcSErRhqnJ9oLirBXzAtCId2s+e+RazjiHsEJlnzoPJ859A5
         ItO3h8/SqXulAGZLo6+7+2PZ2qneY9LmCUXeIwKwqEf3sVhzrYOpWbwjllkLNNQVwirE
         qOrGi5OvqGEfj3XSLpjWpbXAPUovQOwpKuoJBI/0CFQdxVd96WQrl3oe/yg9FHwyzswd
         Y+gEbXCCitwqijoZfBSKSVrRzk6mduZ5rQxSgQ4oZZBO1HsdVCw60HzIditLVjChNrx1
         TQwvst2ApmE0neFql6jV2B9KeQG5gc85Lk74Zahx3R0t4THhkxe9eh5PW7boKzw0YqmS
         e67A==
X-Gm-Message-State: AOJu0YzkPPnl0nblv2oFFUTWh89DZ3N3+fy/s502jEHZdQmmx4NYi/z1
	35d/UP8s17vgf9CXuf4YTTij8uN5SwPlBHs2fV93jtAOi2v9z3JWNL8mVULHQeAVqsU=
X-Gm-Gg: AfdE7clQZ8B8W27RADxcOqjzcQTSOxiDhkksxT+w1gTBuVNfURJHGLOcM6lXPw8kPjC
	sF0AfSqykJ4LeB9emzasx43G3HaYEwNru0nON3GzWJJqFC/ceW50iSxkbDgd3Z8Tb5uqZZRXKIJ
	qN5UaKlXYiWDDHxvSAq5VdCLbUhmvzfgB0wUx0xasekyiUPMOR4r5YhXnnLDldhn3owcdSrHoYg
	GjsdusXGJ4hj/s42D1ws+Iw92B3MlGh5X9v56BYMkvlGVdxxVB+Y2Zv1IREKxgoGwyv+Bj/NgIq
	Sezg6mvdmdR3LbvhEJ78TBRZYIJ5/U8T4myVHgFdK+//+xM70CMQXh/Vo6k+vBwpfLFtWdjwX8g
	CxVg7u/B+YZwKW0wioVeXH6w0ROBCfJcn2WqX6fCD7AVe5tP9vNQd+Io1QdQyI+4MZjRhbs8qBD
	F/jJRtsRkfybutjYcLQE8upbA=
X-Received: by 2002:a05:6a20:4307:b0:3c3:2e2b:29f3 with SMTP id adf61e73a8af0-3c34d5b6f8bmr1421177637.27.1783989177645;
        Mon, 13 Jul 2026 17:32:57 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm78865075eec.27.2026.07.13.17.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 17:32:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 17:32:56 -0700
Message-Id: <DJXVDTIP374I.31QKCXGTTY7UV@nexthop.ai>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] i2c: xiic: fix SMBus block read and PEC support
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Michal Simek"
 <michal.simek@amd.com>, "Shubhrajyoti Datta"
 <shubhrajyoti.datta@gmail.com>, <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260427-i2c-xiic-v1-0-e6207f9aa5ad@nexthop.ai>
 <CAKfKVtGztJkU_HXZTrb2h3hrTJp0SbRo-sDHM4Sj_1SG8ymOyw@mail.gmail.com>
 <0dec4aec-5a62-41af-9509-3bd9e2854739@amd.com>
In-Reply-To: <0dec4aec-5a62-41af-9509-3bd9e2854739@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_173259_375160_12CA574D 
X-CRM114-Status: GOOD (  14.39  )
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

On Tue Jun 9, 2026 at 7:39 AM PDT, Michal Simek wrote:
>
>
> On 6/9/26 16:26, Shubhrajyoti Datta wrote:
>> On Tue, Apr 28, 2026 at 5:48=E2=80=AFAM Abdurrahman Hussain via B4 Relay
>> <devnull+abdurrahman.nexthop.ai@kernel.org> wrote:
>>>
>>> This series fixes three independent bugs in the Xilinx AXI IIC driver
>>> that together make SMBus block reads with PEC return -EBADMSG or -EIO
>>> on otherwise clean transfers. They only surface when the client has
>>> I2C_CLIENT_PEC set; non-PEC block reads happen to mask each issue in
>>> turn.
>>>
>>> The problems were uncovered driving an adm1266 PMBus device behind a
>>> Xilinx AXI IIC FPGA block and reading its 64-byte blackbox record.
>>>
>>> Patch 1 stops xiic_smbus_block_read_setup() from truncating rx_msg->len=
.
>>> The i2c core appends a byte to msg->len when PEC is enabled, so
>>> overwriting the length to "block size + 1" silently drops the PEC byte
>>> and i2c_smbus_check_pec() then reads the last payload byte as the PEC.
>>>
>>> Patch 2 raises the RX_FULL threshold so the interrupt only fires once
>>> every remaining byte (payload plus optional PEC) is already buffered in
>>> the FIFO. The previous threshold of rxmsg_len - 2 caused the
>>> bytes_rem =3D=3D 1 path in xiic_read_rx() to NACK a byte still on the w=
ire.
>>>
>>> Patch 3 stops the BNB handler from forcing tx_msg->len =3D 1 to signal
>>> completion. tx_msg and rx_msg alias the same i2c_msg during a receive,
>>> so this also clobbered rx_msg->len; and because tx_pos is already at 2
>>> in the PEC case, the unsigned subtraction in xiic_tx_space() underflowe=
d
>>> and the STATE_DONE check fell through to STATE_ERROR. Advancing tx_pos
>>> up to msg->len drives tx_space to zero without touching the length.
>>>
>>> All three patches are pure bug fixes; non-PEC behaviour is unchanged.
>>> Tested on real hardware -- a Xilinx AXI IIC controller talking to an
>>> adm1266, where 64-byte PEC-checked block reads now complete cleanly.
>>>
>>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>=20
>> LGTM
>> Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
>
> Acked-by: Michal Simek <michal.simek@amd.com>
>

Andi, are there any objections to merging this series?

Best regards,
Abdurrahman

