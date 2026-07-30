Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBF6C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:Cc:To:From:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlS7RV+1d0UdZ7kkR4emrD6is23fEjwNoBFFfOWF5D8=; b=mjzhAnmE+mhH2tiwRj/TU72oGK
	LdjMWdRzBIvKc1p3/srl/Ha/fTraw3HC4OUa5fgV5LIIGDHjwzDuj7BPfe7nQel7OLWhNzi0rbhdd
	SoB2UouuhD3VxwSwrkMco0IxYokDbejc+q5Hkp+oo1IIB24Vz1kp0SUu41dNOKjPc0xpKz5g48bVy
	YygSCZ3+XgTJ/c2W2/27bOnsSDc1WutMBRNQdMnbnX8JVCOKmq2ESca6UgDs7s9bZXZQ7TGP820Nr
	+uCKd9oIOPcWCzljcg/09uj2bOdAaIpI54TMM+rZvmMrku6OdIx8DABE9xNi8I+ZuoFtgAIcupFtB
	/MrKAZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVj4-0000000BAkr-48ua;
	Thu, 30 Jul 2026 18:43:26 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVj1-0000000BAkR-3Ndy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 18:43:25 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-ca957432c7fso83919a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1785437001; x=1786041801; darn=lists.infradead.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QlS7RV+1d0UdZ7kkR4emrD6is23fEjwNoBFFfOWF5D8=;
        b=jeYKd7VaG+q75RyfzgiVOaxiovF+9Li/m1PZ7q5Eri1/sEjTDpRpl3vwhzrUIGcQsE
         AIh3DDRf+slVbf5UK7ThY9Jo6ewKuOTT+CIsdnIujUlpl+UyFlmw86CSnVssjv/WG5XU
         2CMEbEoaz89F1UeZBbHkq7PpWGdWN8ILEOGPUlORMNsamnLbz6Rrm0WIOTWEbnSld7xR
         HuwXcYRDUxom0pcnOcg/SnRvRidEgFmkzqocfuuBn1cyOjBR+sLrtyWwhtuS1RvrOFM3
         XhZu2RFGmRzJCxxFiCiHo6RZFpERIUGv+ESvY774qDAgfng3Kdw/H0KZpE8OGj88S31X
         cQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785437001; x=1786041801;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlS7RV+1d0UdZ7kkR4emrD6is23fEjwNoBFFfOWF5D8=;
        b=s4ZkZzBO4Fm20XB2RVHng42K1CycJp2gQQik5yGwy6FglpjT2gr1xYABMgFbeTEa9x
         1aOTq/UK3qJnKyLVpeQXnE1MXZuQGHl84aam+bVTAaSttMqAiJtGB1Dnj4qPqB2gJ+A6
         Slb3/RfNRYB9xrWARmWdhaBrNkXin8uc33g5WMZAxj/5b6DyX3ERNnpi8a7XBxDXDgSS
         PjLSikpsWoQSEQVaLpjcplcnozmCgMSvs2vDUcXyYD9nurtoPuIktJq2pvKLc3DN1VQ6
         q79zZc5EZjSi0aTLNCg7J/2xYLoJ4dKQBJxRZuifZm5qh1HKO9nAK1/pwcxBfiYA0iiE
         x5EQ==
X-Gm-Message-State: AOJu0YxgrneV4Oby64ZLEKGS3LhEKCTgNuPI8kxZpELfMRM1Cflefl5b
	COaO8GkRq7aP1eTUFr7r4O/ZIhhNmj5bwGyfH5RiWrMPUYMysQho1ik7VRX2RVoORLgVmYs1HBM
	fPqKWnhs=
X-Gm-Gg: AR+sD10MeZm1cX22Miti70NE1jSEcPFwGDIhkKzdgL+F4kqwU07KfK7oq4rkR6VBU1j
	WcqD9kpQE9jhm43k+U5j59zxt79XP0+Usuil95lhfZaygwPK0+yoC6gyc6HwwTnczjGXnseqJXU
	639CY2B+BJCCT1J487DVXTS2pTTOZXwj6r9sCfYSv0d7Cxunz1brc9thwKGgBhrq2AgjIM42eBg
	+5ROrUWX6ZXZo0MTv9HTeK0T2OxIMAmUqRwTOnx6HZ1fEu/ixXDdGwiEAuEK6EN+Dy3LtKIR82c
	4BDnWOwKa6eF9FhKC1q/5VAJvsi4Drtp+W79nH314heFJ4sYZ2RaDhn89htc3+qAdH96Coi7DEr
	4u/h0obY1QbEknwpDAicciqfniY59aePq33SQEVg6zYjCCRYuij/Ded1UF/SG/1yABVG9PgSA+f
	VDpolWTKeu0Wi7GgANcqbrYUH4Q/cAJhiam4Nl+MewyEoqpcmAbhcAycbsaNKp
X-Received: by 2002:a05:6a21:70cb:b0:3bf:6c08:fba2 with SMTP id adf61e73a8af0-3c900978720mr3358115637.54.1785437000995;
        Thu, 30 Jul 2026 11:43:20 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm44493802eec.22.2026.07.30.11.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 11:43:20 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 11:43:19 -0700
Message-Id: <DKC4LEBVE3DK.29E8XONGJDS14@nexthop.ai>
Subject: Re: [PATCH v3 0/3] i2c: xiic: fix SMBus block read and PEC support
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Michal Simek" <michal.simek@amd.com>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Andi Shyti" <andi.shyti@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260513-i2c-xiic-v3-0-ccb3cf70ba03@nexthop.ai>
 <7a967984-9979-4874-b636-94014487ea11@amd.com>
In-Reply-To: <7a967984-9979-4874-b636-94014487ea11@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_114323_861505_AD757557 
X-CRM114-Status: GOOD (  24.09  )
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

On Tue Jun 9, 2026 at 7:41 AM PDT, Michal Simek wrote:
>
>
> On 5/13/26 12:09, Abdurrahman Hussain wrote:
>> This series fixes three independent bugs in the Xilinx AXI IIC driver
>> that together make SMBus block reads with PEC return -EBADMSG or -EIO
>> on otherwise clean transfers. They only surface when the client has
>> I2C_CLIENT_PEC set; non-PEC block reads happen to mask each issue in
>> turn.
>>=20
>> The problems were uncovered driving an adm1266 PMBus device behind a
>> Xilinx AXI IIC FPGA block and reading its 64-byte blackbox record.
>>=20
>> Patch 1 stops xiic_smbus_block_read_setup() from truncating rx_msg->len.
>> The i2c core appends a byte to msg->len when PEC is enabled, so
>> overwriting the length to "block size + 1" silently drops the PEC byte
>> and i2c_smbus_check_pec() then reads the last payload byte as the PEC.
>>=20
>> Patch 2 raises the RX_FULL threshold so the interrupt only fires once
>> every remaining byte (payload plus optional PEC) is already buffered in
>> the FIFO. The previous threshold of rxmsg_len - 2 caused the
>> bytes_rem =3D=3D 1 path in xiic_read_rx() to NACK a byte still on the wi=
re.
>> The chunk-vs-defer guard now also accounts for the PEC byte so a
>> rxmsg_len =3D=3D IIC_RX_FIFO_DEPTH PEC-enabled read does not push
>> XIIC_RFD_REG_OFFSET past its 4-bit range.
>>=20
>> Patch 3 stops the BNB handler from forcing tx_msg->len =3D 1 to signal
>> completion. tx_msg and rx_msg alias the same i2c_msg during a receive,
>> so this also clobbered rx_msg->len; and because tx_pos is already at 2
>> in the PEC case, the unsigned subtraction in xiic_tx_space() underflowed
>> and the STATE_DONE check fell through to STATE_ERROR. Advancing tx_pos
>> up to msg->len drives tx_space to zero without touching the length.
>>=20
>> All three patches are pure bug fixes; non-PEC behaviour is unchanged.
>> Tested on real hardware -- a Xilinx AXI IIC controller talking to an
>> adm1266, where 64-byte PEC-checked block reads now complete cleanly.
>>=20
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>> ---
>> Changes in v3 (addresses the sashiko automated review of v2):
>> - Patch 1: handle short SMBus block reads where the controller pads
>>    rx_msg->len up to SMBUS_BLOCK_READ_MIN_LEN for its end-of-message
>>    workaround. In v2 this branch left the PEC byte at the padded
>>    offset rather than the actual end-of-payload, so the i2c core's
>>    PEC validator read past the chip data. Track the on-wire length
>>    in a new smbus_actual_len field populated in the minlen branch
>>    of xiic_smbus_block_read_setup(), and trim rx_msg->len back at
>>    RX_FULL completion before passing the message up. Addresses
>>    sashiko's v2 note about the pec_len adjustment missing the
>>    rxmsg_len < 3 padding branch; that branch was indeed the cause
>>    of pmbus_check_block_register() silently failing on zero-length
>>    MFR_* fields and skipping debugfs auto-discovery on affected
>>    hardware.
>> - Patch 3: defensively reset smbus_actual_len in the BNB completion
>>    handler so a subsequent non-SMBus transfer cannot see a stale
>>    trim value from a completed short block read.
>> - Patch 2 is unchanged from v2. sashiko's two other v2 notes were
>>    investigated and judged not to require code changes: the concern
>>    about removed padding in the chunked-vs-deferred drain misread
>>    the patch (the padding survives via the else branch and the new
>>    PEC-aware guard preserves the original semantics), and the
>>    flagged unsigned underflow in xiic_tx_space() is unreachable
>>    because tx_pos is bounded by tx_msg->len at the call site.
>> - Link to v2: https://patch.msgid.link/20260511-i2c-xiic-v2-0-c16380cb15=
94@nexthop.ai
>>=20
>> Changes in v2:
>> - Patch 2: widen the chunk-vs-defer guard in xiic_smbus_block_read_setup=
()
>>    to include pec_len, so a 16-byte PEC-enabled block read routes throug=
h
>>    the chunked drain rather than writing 16 into the 4-bit
>>    XIIC_RFD_REG_OFFSET register. No tree-level change to patches 1 or 3.
>> - Link to v1: https://patch.msgid.link/20260427-i2c-xiic-v1-0-e6207f9aa5=
ad@nexthop.ai
>>=20
>> To: Michal Simek <michal.simek@amd.com>
>> To: Andi Shyti <andi.shyti@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-i2c@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>>=20
>> ---
>> Abdurrahman Hussain (3):
>>        i2c: xiic: preserve PEC byte length in SMBus block read setup
>>        i2c: xiic: defer RX_FULL until all trailing bytes are in FIFO
>>        i2c: xiic: don't clobber msg->len to signal block-read completion
>>=20
>>   drivers/i2c/busses/i2c-xiic.c | 67 ++++++++++++++++++++++++++++++++---=
--------
>>   1 file changed, 50 insertions(+), 17 deletions(-)
>> ---
>> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
>> change-id: 20260427-i2c-xiic-2aeb501ec02a
>>=20
>> Best regards,
>> --
>> Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>=20
>
> Acked-by: Michal Simek <michal.simek@amd.com>
>
> Thanks,
> Michal

Hi Andi,

I haven't heard from the list on this patch series in a while. Could
this be added to the next merge window? I'd be more than happy to
address any issues/comments.

Thanks,
Abdurrahman

