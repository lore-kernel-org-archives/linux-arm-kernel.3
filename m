Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4270DCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHEG/xfDI4QVRzLkC333ArRNT1z/YuMXQtFRTicIrLU=; b=hVd5ZV2t7NK0LSn9/Cx++tXw2B
	u6OJIC44HdOmJ9R8VeHexITbHTZ+YsrX4uXZAP9vSbjEMGOZXqC8K3/+8w8xKrB8C6a3DRkuK1IFp
	s/LzihMZDd0fKkVP2tMm99zvxdnARaEOHrWWzg7ON6bpG3ggDRNZcYL5PG9fwtmnmOKG+4A4IQq6v
	wymQ7Okkm9ATlrJmkNdb55+0bQapBT3Kb0Tl2CXNaZqDklqqd3GivNsZChU4uaGSmC8d+06bIkPhE
	m/DCKcXvmGtihUlChMReoz84MR8hAWtPtKiFD7IPUCQ9gWZbweIp+Utxrpgqz7xoDV2FblPvxXkIl
	3Z5HgZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxPa-00000005lNL-0Czl;
	Tue, 09 Jun 2026 14:26:38 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxPX-00000005lMi-3T45
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:26:37 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7dee6b76a73so55353947b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781015194; cv=none;
        d=google.com; s=arc-20240605;
        b=VJ+z4l72S43dPPyxxKJVt/51r+H5GLEJ0Rocy7sSPvHvR9l5u5IHX7gxuZpUPZDu5S
         ogDO8C40Z2iYJKOPbc9Bke9N2zQt/TWdunGrVsMPqtkC3WlbMFi+tliFiwkZfBfBgmtg
         PjclcvkjqK4/aGxudZrdBWbPHsrnMQkya3PqcOPJAn/kj9BlP4i9k1W2bGaopqUceLYB
         NivofLg41W+De0NWF3/Rvn/Y/nvrn6jgO6tJVJ+whwy0s0T19kYhmuMSf5dlw6uC+c3J
         wFrkLiEPM0j7II8mAu6vKl6ySUNnqGbaegLsYVVN9OzBQ+1eIM+IHTZU1oPlWO4GiQ5b
         zxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eHEG/xfDI4QVRzLkC333ArRNT1z/YuMXQtFRTicIrLU=;
        fh=r1GjNEnXY8knWTUMHklLB3brBLawsqTsPxZVIzGIwcc=;
        b=Xp4cw+tKKtHyZrRqXZ777ekftEtEmfzqYMhWmLt9tjdUWEJSQ6ap0vXoIDF9BEgnJw
         n2hozHp3uoV3Z9GTiCvN2JTVjMOYJfMc9fkhvH+pvoPhrsxYvplacFzau/ylKj9tVNAF
         8jOqyqgH0/16a9g4TGPTqLT8Ni8/SjPkD/2o0dWfUByPcCWjW6wFgPRQ1i30lkpUHc7A
         wTHqqpB1hjHyPgP8u+dTbrsHlTe6pYZA1RjsYm6RgR8OyC1k1TJXkO/PK1Tzumoj9GqO
         67uZy7yj4HvxnL21cr5pXpRQ3fT9X+wQX9zAMPbZzUOiWawOMSq/CVF0OBOtDf1jzWlh
         fZEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015194; x=1781619994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHEG/xfDI4QVRzLkC333ArRNT1z/YuMXQtFRTicIrLU=;
        b=qRDwBcK74rws2ybn0DKJNxdpVDBybmE5/KPQG6+BZOhCWWl7ulPVJXOv04jAsQmDsC
         /qti1UDVfXcfCzcNIa9pLXzADHjk50zg+UUDAu/QJvkC/2j9OIR0tg/ivFIsVicSKj0o
         3eMFAxLStB28pAHJQpLo6Fzm2s/y7NawhFRVX/mEEpNPREl32yCIwMV2eXGsqPC60KAr
         PUSj+0A5FABgObXdu4XGxpQm57OyAcOFPSdSKbSipHMVCRI3FqBOqN14AqF68Qc6jo4D
         AmgZG9pRR3L2+ZKmemP9EjNI1ijd44fittqBgZ+Ys+kGu9Oc5VsyA0DV7B/pbUZ7AEJH
         j6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015194; x=1781619994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHEG/xfDI4QVRzLkC333ArRNT1z/YuMXQtFRTicIrLU=;
        b=VxgqISkjaEtssLKnfQc9wAw4Mrcjui47WYrln64SQA43+o+Ph1xNdieZYp0lNMI3BI
         zZqMjLK22o3wbHMwzCwp8grSBi9e+H7jQvvTUgxzv/rH6yJlJmdxGn1q7hRv+mn6UAZ3
         KR8IBTuUPYPeKz+zW6Mh9A3LgvLLzsU6pcBSNbOqEwD3Kimrx6Xo+4sJ0Nyv04Rdh75g
         Iqx0ikrEeTfNUf4qrgIyxb73innx8EG+S0Ke3wV8b+pHAOCVFRbnsUkTrUJ6hDO4I6ao
         bq3L6uR9VeSEK4Xqs5o5/smSYa6FmEKllw6SsZhKSbNRgfmi65Bw7YtyY1TkKOEiIo4S
         PAJw==
X-Forwarded-Encrypted: i=1; AFNElJ83nlXHr/1bO142uBmsUNTvEUiOecXYnyX0A6DDhb77USqSy2Qnr2zZP2X6+Ll/eFm3WdDedU32mWC+gDoERkb3@lists.infradead.org
X-Gm-Message-State: AOJu0YxcomnHJr2UYkTmeSPlmWOEWqTSdCQLYQWS0TRuX01MjLVEpRLX
	on9aFbMBJTe+VKw1TbHM3KgOR8YyBGJqoupP0N6Fq0sT68fHFN6VO2lxksCy9/wlJLPd98NmJhH
	JM/qKD3RceWrsMI0W8Vn0FkqPhvVG+TI=
X-Gm-Gg: Acq92OFio71d7nhKE7vy9ngTQX7m8mtVWC2XhJlVllzZI/JWG191ti0Yjdon91Q2+CO
	4FtqIZ5hBqeGTUZCa6rhjPyGO4EYukHRjdijHqq9YrrJbMqgNCr4bFUDo/5aTZUs3I3CtjsgdZD
	76JpA4Elo2ZUiZQREe/Kepc3fUz6cchUigNkL9rnfN2wI0RwPKe0QTSNYNcAGgP78KOJj0z3U4v
	qKMsbe3XS+mVcjEokL4agW87oECDfFDM9S7d6sT5OSC4nyjrNMRl5QARUIc+ogs0ifZ5KNGBS+M
	C2sGl8lCfkGdF3wiAFY=
X-Received: by 2002:a05:690c:4481:b0:7db:ccda:a40d with SMTP id
 00721157ae682-7f2b4cb2116mr28302087b3.5.1781015194341; Tue, 09 Jun 2026
 07:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-i2c-xiic-v1-0-e6207f9aa5ad@nexthop.ai>
In-Reply-To: <20260427-i2c-xiic-v1-0-e6207f9aa5ad@nexthop.ai>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Tue, 9 Jun 2026 19:56:21 +0530
X-Gm-Features: AVVi8CennXEvmKXZcOS3a-5UF83FXzEW1vW2_jb7_VGjy_gZpB9TQvK-ef8eNYE
Message-ID: <CAKfKVtGztJkU_HXZTrb2h3hrTJp0SbRo-sDHM4Sj_1SG8ymOyw@mail.gmail.com>
Subject: Re: [PATCH 0/3] i2c: xiic: fix SMBus block read and PEC support
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_072635_901921_A648C8FA 
X-CRM114-Status: GOOD (  17.48  )
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

On Tue, Apr 28, 2026 at 5:48=E2=80=AFAM Abdurrahman Hussain via B4 Relay
<devnull+abdurrahman.nexthop.ai@kernel.org> wrote:
>
> This series fixes three independent bugs in the Xilinx AXI IIC driver
> that together make SMBus block reads with PEC return -EBADMSG or -EIO
> on otherwise clean transfers. They only surface when the client has
> I2C_CLIENT_PEC set; non-PEC block reads happen to mask each issue in
> turn.
>
> The problems were uncovered driving an adm1266 PMBus device behind a
> Xilinx AXI IIC FPGA block and reading its 64-byte blackbox record.
>
> Patch 1 stops xiic_smbus_block_read_setup() from truncating rx_msg->len.
> The i2c core appends a byte to msg->len when PEC is enabled, so
> overwriting the length to "block size + 1" silently drops the PEC byte
> and i2c_smbus_check_pec() then reads the last payload byte as the PEC.
>
> Patch 2 raises the RX_FULL threshold so the interrupt only fires once
> every remaining byte (payload plus optional PEC) is already buffered in
> the FIFO. The previous threshold of rxmsg_len - 2 caused the
> bytes_rem =3D=3D 1 path in xiic_read_rx() to NACK a byte still on the wir=
e.
>
> Patch 3 stops the BNB handler from forcing tx_msg->len =3D 1 to signal
> completion. tx_msg and rx_msg alias the same i2c_msg during a receive,
> so this also clobbered rx_msg->len; and because tx_pos is already at 2
> in the PEC case, the unsigned subtraction in xiic_tx_space() underflowed
> and the STATE_DONE check fell through to STATE_ERROR. Advancing tx_pos
> up to msg->len drives tx_space to zero without touching the length.
>
> All three patches are pure bug fixes; non-PEC behaviour is unchanged.
> Tested on real hardware -- a Xilinx AXI IIC controller talking to an
> adm1266, where 64-byte PEC-checked block reads now complete cleanly.
>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

LGTM
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

