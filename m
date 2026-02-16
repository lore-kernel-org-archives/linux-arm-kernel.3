Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA92EE7BD91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftDignL4WzNnl5qdQF8sL+16BU85AR39R9Mhqdc8SDA=; b=nZQgRtvuwE9nGtZsmIq/PWwWLj
	76QnnAhR04MZMhbN/yypLjriSVD+H4NFQ1Z3oTvvYTthRHHxN98S4kRWqHbQeskt3u9+QzNYsW3Et
	npgPwkbRZm5mq4wwVVqTtKA6r+rlMJPsNqZYNvZAf63ZpW3voBzfX2sBsMw7Mg1EFI2eFuGmOOKn8
	L58ZebQH2wKAMr/QQumr6T7wU2J9jCVDpldfrmDSFtPza1d7uU6LDrphG8QHFERYU5VWO98UZwiOi
	dDyJLCuJyKhfSFuhHjhXHSxFMkc2S/NRQWm4pgx+UbTrGui9Lx0/48u3kt380LrKO4T1aH1y9MO9z
	x8FlMaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwWC-00000006QmQ-1uTK;
	Mon, 16 Feb 2026 11:11:56 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwW9-00000006Qm6-3edS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:11:55 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1271257ae53so3027219c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:11:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771240312; cv=none;
        d=google.com; s=arc-20240605;
        b=RGo6jJMcX1OLaTFm8VX6tHkAvMAdF+LS8vprJONwp+UHKFsQVQkUaMWlIu/bVPgrQw
         ucc4sATqap9ogO9yGOafrvwp5w45r/oF+Llhx885uud7292dROlkeIzNZomMkHbcnXY+
         9iON3CzmQhRsOY4Ld02Ywpi64iAGTOjPsnsEMIPg2TjDf4ajb1VsoMiRA3EoKG1TdkVl
         plWP+hEiNz4MdXiFQj49AQ56sIQ0zgPgmB+VrdlA+hwamGN7B34ZV3jcSWjoqC7sBl8t
         frTYjUnePUQWQ+95sZ6ZxhMKEzOrfyz432qDlBoMdtehvAQL9Y9m60ZryMHj9hEv4w2P
         y/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ftDignL4WzNnl5qdQF8sL+16BU85AR39R9Mhqdc8SDA=;
        fh=wvHJoKfa1sePmDpQ9GSbCPsgdS8h6spd0CT0d0DNAow=;
        b=Njm4flT73/uwL5duD1fcXw8SjA64l5zBJGaZuf3HkzyG5dJOwxUoAvSlXWOYZSQorb
         Rsn8UoPzRZICaRu9mkEYju50q/3GwscfFflnZx37e28LfdFvq/HNptLhm06SM69vRZK/
         pBLMenIIrWSDMwbBRa+RQ5OmtmQ27i8B+6z8oTAbEBJ9lygVgfdBK6TQDEs5rialQVoB
         gNxa52AYv3s9uCAT7KKDF+qJHFV8j9ZTrETVu4qpVPUjrxXkfDdZrTxoHF1fKp8EcPXK
         wiTITJ3+fjloe3GU4YDa3k3GlfwqXSzA4Kf5GDFSm5t3xpgPy4ZgnFlDsFKyj5DRhMi8
         gXlA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771240312; x=1771845112; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftDignL4WzNnl5qdQF8sL+16BU85AR39R9Mhqdc8SDA=;
        b=FzUK8gPwAfNHyex0Bv9nz4Fio7U9GoilV6IeCGg016sj3E2zD0ti17DQx/9PrNlxgV
         ywrP5CTQr8LaKYLoY8gBXFCtjdSJnxK+NDEegGg2BJVSJmf+FOMS6IAIx8zMzkwL2pbk
         vhVV8lUna0rDEGSKfAn2d1AYP/rFSX1zlxBTRU9OqrDI6JR4dci6VLz8LimWc4OlKwMD
         kzs5q5jEYYBuaDp/CvhiW6yy/YOj//T5Ro6+AiFlb3gGmZdH/OxCvBDW9nJl/jMldjnN
         NxY+b6P1tYVIItLG+oYVYMXXxy7Q95f3roLIWHyxhUcw4pKXBXW2+a/IYbjRy8tzgK5F
         CsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240312; x=1771845112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftDignL4WzNnl5qdQF8sL+16BU85AR39R9Mhqdc8SDA=;
        b=Xzic36ILdG2C/xgXFnd+/wy4bKSXA59OCArysjQyczmr+ZRJdyB+mqGcpFy0naVNE0
         YmjU5XyZAkcDbJ/8oH/nAFPDeCs8VjGDF7fiVHlPWl/eemNLI53IKizCj/VHkzUunSFJ
         3wviTEaX8yUz/6OreKQ2SH70/B+UIJRq8NiXZX4mBh+Q+zilAubNy7xf9+RurnxzY3Wz
         jrDCzJwZ634l00+DgHk51YvZ2COZJyI9vnCh7btm0duW97uqzHppLNy66h9MZjpt/0Qy
         DNCPRWIT3NWn/a+Gbn6rn+gODvir9qIZRv4YavjaQyFF+AD5xzLzJaxs6j3Oqof0+USy
         Pd5A==
X-Forwarded-Encrypted: i=1; AJvYcCWmrahTiiusjJ2H9ncQo9nYk5iO55mMRvoiLF74SWMod6UpHxaOS8VcAFpK5fliX4Vt5j/rzngPK/VakTu1wo69@lists.infradead.org
X-Gm-Message-State: AOJu0YzALlYSrwlNG/i3KE0EtBfnTJXtzqYfaC6UtTJp5CrtyNEb5xD4
	iaVd790+BGOEIs3ZOEsFKUus2HpU9ZRW29lyFpFRstZqjCDAJIkIp9TalInE0cTK7IRp4sWNevC
	MQaicmeNnKPGCdicinHUVfrMEZ41uHsA=
X-Gm-Gg: AZuq6aIE2x0sQ4wNzkDba4xP7JOg6P8z+wwI6dbfBsUniHNHwizYvX0MBG+HnfCyqXP
	B+w7fI90D+8wTUKwxwHBP68oqrawD6hfC0e/qda7TNPiUpdcsy7lcbSBltseq25T5ai8KqNDDVn
	p9CAxtnuYrMfplGll/tDCZuesgPBKC/+6895BgxivWHiyRlqoFEWhDCmap+i17G6s7sCatM1jBo
	T9IToQ4goUmBRMRN0ylyYLqKSldgz4qP3AaWhqlJvFfKo89o5vOvLbmkNgZOP1SgbB8q3HxVEwC
	zk2c3XGJatZp7HhIR21rq1iiZhE6cXg385Yivkz365KHXRc1jLFgeMXRkQ0Aq6dZWCBEjEPhOLQ
	MCI34xOSg8znsKFcWN+1fTg==
X-Received: by 2002:a05:7022:522:b0:11d:f44c:ad97 with SMTP id
 a92af1059eb24-1273ae2eecamr4723312c88.24.1771240312306; Mon, 16 Feb 2026
 03:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20260216082329.32029-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216082329.32029-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Feb 2026 13:14:41 +0200
X-Gm-Features: AaiRm507exKUTRJTshhh5puxfJRVlFQ2G216FPRQAg0rPj-3mSrWr8EUdA4CEy4
Message-ID: <CAEnQRZCntEfQt9t0MO04rryDVDGn2UT75_uw0x+F0q73ogpdmg@mail.gmail.com>
Subject: Re: [PATCH] firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb
 variable static
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_031154_073055_F8F1C8CA 
X-CRM114-Status: UNSURE (   9.37  )
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

On Mon, Feb 16, 2026 at 10:23=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> File-scope 'scmi_imx_misc_ctrl_nb' is not used outside of this unit, so
> make it static to silence sparse warning:
>
>   sm-misc.c:19:23: warning: symbol 'scmi_imx_misc_ctrl_nb' was not declar=
ed. Should it be static?
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

