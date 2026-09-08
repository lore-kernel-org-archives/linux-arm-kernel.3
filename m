Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8B2C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 02:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKmONGyZLE0mSFol5WqnN+Rq5dtwnD7RFNzUtmGhC/w=; b=4glU87wArHEpoumYV5O5ryetaj
	HHqHSxWWiYaXhOqLB18lwUCwkceexiCItdVucVzjqQnfgpktSKJABZtHrn4pYgDH6VNMb9QwT6yhO
	FwNKvbPfZw10Egpiz+MFQOiwjcz51LOCQqRGbEcyzOqf8cOCHv5q92g4zPqO12R9flm1/FyjuVXcy
	Ntq+G5gvKfgFPT8ZmvTCa928RuIsBR4DDpqXQpnZwQ0wHMiGwTO3fQhYBuDyY+MNeP/lyczUPXs5j
	YCgbidg5i4TVOD30PdsyStezaMXrWhChlndxgIeEvECHlx7QvnH5uqb0LyMz+GR/2UxDOryxZpa1W
	XCmYPMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3lvx-00000007wd1-0Gf2;
	Tue, 08 Sep 2026 02:51:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3lvu-00000007wcg-30eF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 02:51:40 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2d6d28aa26cso24721425ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 19:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788835898; cv=none;
        d=google.com; s=arc-20260327;
        b=pSJI4xGpPA2Xk4sMHwY2yjwZ05I9bMe6p8TCUKC0tR/vddp/60Y5BDhyFOolNwGhtd
         tOzJ5kuTOMKFNXWKxwgHv+Noj02QaiQY/oL509ArKBwzzY2PZBRNUHlVYhc3kcpYwKqG
         +eMKB3F52rKwnIu7n16Fs+NU94O8N1gGoLCSnhdC1h8GoNdY/47Ebij2PMj0o59oMN5n
         6f3NnSAT2K7vhxZQYft/OrcMlWOsPHN4nI/aFJ/tsEBZLzd+/a5AFjGfKAVgav8bLbY/
         5eoTphj8eUXGOEVgAzo4DWBDYKtA+uQmU/xyW59G5T/wjjRG9hJgQlCJHb50TJNongwr
         QNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKmONGyZLE0mSFol5WqnN+Rq5dtwnD7RFNzUtmGhC/w=;
        fh=Jfq2HR8cI6EKaRcx57CoA2QrlBkNQodyWS0nqEy+kmU=;
        b=sd8T0D1nZPJX9CGelmg5gGAGpH7KPgFuD3cpaC/EknOfjdrBMDoojTP7Ltj5/fsWwq
         bWuTdTP2PMqeHoVLKsl4I+czzqU6apAQcby8OJYFh9rj0rzU1822ZhsjtR0ITTZmkNLD
         fbDw9eExVS0aDUdDl+eMz0KrG/Yt+XW6i5VKzCSxW1x4bJsPt1zmmhqKDEK5hNCZa4BZ
         MSAY3kQKwze6vsDAWVf758MpgPz/3qNDDwf8YQ0cVAV8/tzoAMqRwqequzah3rUNW3Nr
         61ZW/CCrPEQt47WNK6aOSbKaRsRP9cjED+HwDXVsikgsYudrBQXgGHwVHKUJikv3qnRi
         tm9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788835898; x=1789440698; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKmONGyZLE0mSFol5WqnN+Rq5dtwnD7RFNzUtmGhC/w=;
        b=J9uoAB2eIBDi4drVFVSd2xnMQE7SwPhYlWQFUwjTNSUMsxRJsmRjzR8WsYjUkeNU/t
         2dmexCo1ZpQ4XywgzaKxsZD2fuLQ0YUVCpBm+4m7JRqn7whlgODaBfU9PQ6SegUzkiss
         rATlq/W3XfBr89/nrsarGdOoPh5fRIPRtE/dC1qU6w4ysNybeD2faMJSfSDC3PvD8x94
         G/PtDKF3vBZsfdCIFe1Jtu60Z6n0ld/oL7dciTXKZ2N0GlwQi+hyOm0mtHM0d7xHnv0Q
         Xh8W8oSgwVFe+P939QKN6BoObJAj+UkRKXewF2jxYcsFXg87nhmqPT55JSz7ZcnLVM+7
         n3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788835898; x=1789440698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKmONGyZLE0mSFol5WqnN+Rq5dtwnD7RFNzUtmGhC/w=;
        b=sESaGxw/IcbZInGSFxzDm/WFHUmc1pr5baPfdh9D1JEfvIsSiQrmNC5qyaLDuZulvV
         z5DiLNQjMIZeKoSiZff0sfY4h+EhfYuMkNY4e8NrjJOpwS1EP8c4jgjksJTR7LtpoqEZ
         TmTTcuBnJ5/2RdwuFPuN6uADrQSkHKDgAzbGcRDytfK+OE8dlVU85uFl/B/LScJ6igyc
         qm2QInH0SXmpREoLF2eVsrNrGzufZI2S3A77ZEnSvyggWRlxxVweywo/nJQGOpHt2RJV
         JEodsYOXPRZmamEHDjJSXqZE481kl3rHueNvrF1oN/COUC9NmZqmLqxIKsDUPpCUm3X8
         C6Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzHb1rY509BX1MQH4g1rQ3eHrQGSK9QWk99ujS3XjFanGOXrlbo4K/xybpjfu5qOAhEYPLJQt8O23P1CTVL98c5@lists.infradead.org
X-Gm-Message-State: AFuF++kHaoEOENAW8L7+o+l6vTbnXHOmAJ1ZLtN9fag6UYGKOvRlAULV
	rPVYCFpULv8EoE5TBXmVQSDOHGHsJMgOmjCo4flp7GWigNimOTr6/aDJeYKefl76q2MnJByY6Tj
	xMw10GVdSIXPnXKtksmHUlP86LA1DKe0=
X-Gm-Gg: AYBFou13f4zYxFdtYa8222SJV1olfqHFZQwSDQbNG/NnQspR9bJ5+uDjviTDnrK/VcH
	cyWzfSVCxZx0PBHaMjtRZJGT2S+ZhXIHYqHBlOrbWCYhROCNjGoD3e1myyVgciNaSfyG2roZRXl
	rJZH7nEK1wMKFUEBhT3stgtIks/1ULlXAnx03kWSX8W/mHQMXYNkviX3XCeyplhMX+aTvl22dGU
	gCyOXecHDEJgyl4Zklh5f7CzbKxogvKvkPjoEJD55S8cBUeM82qQrp/Rz8t+hU2PS4MSHxeoROr
	Q3NzqaNLSd05Oyx/lFYHHahwITLlXZiyyFU2bvzm1GkaCD5CZZXGaOIEk371YCn/TWA/Gts6jRu
	AVvGTYl9JKwvzZ0B15OIg0VNkg5CkhAVrNpuN1sJpukaQDJ2cKPw1QBAV
X-Received: by 2002:a17:90b:5246:b0:39a:e983:d4bd with SMTP id
 98e67ed59e1d1-39b262a3cf7mr42316995a91.24.1788835897564; Mon, 07 Sep 2026
 19:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260903073252.339250-4-phucduc.bui@gmail.com> <178880965548.219967.14368880612178322930@kernel.org>
In-Reply-To: <178880965548.219967.14368880612178322930@kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 09:51:26 +0700
X-Gm-Features: AcwNN1VwiAbwrJcmq7TcgAi0rtpY-ROP8xxDPfs6JX1Nxzg7aEsWZmU4z3Xejgg
Message-ID: <CAABR9nFGduckDNRGBt0NHdSHNPo1pKD1PJbtpw1eUqL200LCdQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: xilinx: axienet: Fix IRQ error handling
To: netdev-bot+sashiko@kernel.org
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com, 
	horms@kernel.org, andre.przywara@arm.com, hancock@sedsystems.ca, 
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_195138_770572_E7795A0D 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> - [High] Incomplete fix: the axistream-connected branch of
>   axienet_probe() still cannot request a probe retry, and this patch now=
=E2=80=A6
>

irq_of_parse_and_map() has always folded every failure into plain 0,
with no way to tell "not ready yet" from "malformed DT". Before this
patch, that 0 was already turned into a terminal -ENOMEM, not
-EPROBE_DEFER, so there was no retry path to begin with - this patch
doesn't remove one, it's a pre-existing API-level limitation.

> Pre-existing issues:
> - [Medium] DT binding and driver disagree on interrupt index ordering.
>

This is a pre-existing issue, unrelated to this patch. I'll keep this
patch's scope as is.

