Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FBDE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pM7U1GSGMw58mKFSa/5KwQJ4aVmx/cTtBUSfrJJX6Q=; b=s6MCOuO00NOkEuW/xingmLTmTW
	G3Y+Mj/WRKvpK9yhDhaUxaRNFjuRt2ug5AtOtHLQpjgLGzEymbz5B1c37aZuNnAHeLzr2FM3gXJRR
	TH1VY2/pTVo3mt61Hucbh4e3nrF98bxoaaAFCzuFcrnnObq3r9kunKptPz3S0Usc0GmoIg9qWgTca
	mAmLAKUaV0zP7MSjFv/q6ASbuCci42Pn0/U15f/RzuyMX6xZLiXjhsm9cIszrYyhm6pLwAzIbIL7q
	Z6JaD0bVVCf5umBTmQB3p7IMeulFc01Uf3NEajq6HEITiNHCWHkdU7Qhhp4uWQ8RRkag7ikEx/aiN
	dqN023+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnZc-00000009cuS-0vDq;
	Mon, 09 Dec 2024 23:53:56 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnYW-00000009clx-0Oz4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 23:52:50 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-30039432861so32290731fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 15:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733788366; x=1734393166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8pM7U1GSGMw58mKFSa/5KwQJ4aVmx/cTtBUSfrJJX6Q=;
        b=jd2a4BgdiB4m0Yfdz38kVbFQ/RhdGJqPomvikK/1jsf/QfNXNsrINsy7XmQU3+ym2l
         lAvP6ydK+uQHAEGR8i3c/g9DocouBGNksTh7SpefXYtZKJA7ySpmo8JcD1ZVl+fl4ADS
         lp1WQVb6ZSEKWpL/IvTixMn0xX+MyybQqWIraY1DhqLYGxvySJymRPKZGJc/lHfjus9f
         72jvJ04PWzGJiwgowzwbA0ogek5L4oFdTQB9Lv5PEPudJK0WWiiB85X5kyfY4Av8/eay
         UGlK++C/yHfjkbtaXJC3rosGCFipwfz6OQXzGB98Xb6uR8BqTvw34TRuT91zisuNv6k7
         UxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733788366; x=1734393166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pM7U1GSGMw58mKFSa/5KwQJ4aVmx/cTtBUSfrJJX6Q=;
        b=F65pL65lmk9UA/Eo5XlQAhgvWHCEQYehuFvfDYEoWdzOx95XEgrC6plYebcBTnKte+
         XwF7PcVktxKvGzS44V5zZjCGUwGJSj0noVpHjCawM8QoOMMPYRUpbDqUVw+h44DHcWwJ
         8nkGO/ttXXShutBsYgSqbdW4IaNRhmuK8qOOyHkDM/ZS495Xly29HF7vcpfzIyHzhkDi
         LxeASJocmTGkIg6bgmIGBQLwD+U+rbRdyYGA5crWp1HiWOiYm/rEMrRUuZs2mDmwO8/P
         KEVTOLNvx7U4o3eWgjdEyXJ3FDX6V3RN32m/lkV9wAAZVZWYgiJfDg+36JkOHoa+Datx
         kWiw==
X-Forwarded-Encrypted: i=1; AJvYcCWFxLpYbf6UOPoIBS7ebLGDTQmFrf8koVBXQwX6+qcbxFfthX7Ejo+CkiPq38NUi4XMikfpmSy4oDbdXNjQR6zt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4uTg2zKBBUUOENCE71UG3TK3e1tc9+xAKwaVaL7+uG5dpkUo2
	NFYCROzeOqM8EUhvW9d3lc4VpgdPcnjC4i6WeVp1wJKy2A+cdvjWuzrK5FUh3jg=
X-Gm-Gg: ASbGncvVUULuUloU7lxlqq6X78Ous9dw4f6mHM9kwVXDcCWvCj04Gmx2sf12D34j2f7
	29a73Jff+5ohaDDBBcoqUMr2nSZQojKx7mE8fU4eb4ouL/o8cXcILNMzcf0BDfs6MhFj+1o9Ur5
	dCSib/KLFACxS6Akbkbbv1g9U5LQEyPGpunrXDKUWUcDTcxZuBmEksOEr4FtIQNjgPam3w2OkAz
	xOJXS8Bp3nicsI2b9nBi0t4D/vTPJ6nMeeUBGJdiOau8E7mnQcZ0lcMVCsWzCE0mdei7+JE5+F/
	k4TxQU9PW8o/xSl0+2fMXRGfUV34a3PeKA==
X-Google-Smtp-Source: AGHT+IHyF5rktCxD8kY/bacLUOJzx36QikPDeY4Bw3Za1LgYmjbnjgANCIKBZa1aDn+yZRzJ2gM1lA==
X-Received: by 2002:a2e:b8d0:0:b0:2fb:5035:a03 with SMTP id 38308e7fff4ca-3022fd42e9amr6845101fa.14.1733788366224;
        Mon, 09 Dec 2024 15:52:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3021a5fa257sm6740481fa.81.2024.12.09.15.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:52:44 -0800 (PST)
Date: Tue, 10 Dec 2024 01:52:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Julius Werner <jwerner@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: errata: Add QCOM_KRYO_2XX_GOLD to the
 spectre_bhb_firmware_mitigated_list
Message-ID: <w725lby34vpavm3knq3ikz2wb4tzlfr4elbgf25mjbvgamtq5t@zgc52dc2wvsy>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.2.Ia3dfc0afadbfbee81bb2efb0672262470973dd08@changeid>
 <wx6qbdbcrvbq34snzkxawlbpxm6vogt5ccjmdqqyazukfbjy7t@qkvax7tr27bs>
 <CAODwPW8mq-saJuTYnMhA6bCopcjQwBxEoyWhQB60Jg1m7wUZkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAODwPW8mq-saJuTYnMhA6bCopcjQwBxEoyWhQB60Jg1m7wUZkw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_155248_143341_178ED7BC 
X-CRM114-Status: GOOD (  20.99  )
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

On Mon, Dec 09, 2024 at 03:34:59PM -0800, Julius Werner wrote:
> > > NOTE: presumably this patch won't actually do much on its own because
> > > (I believe) it requires a firmware update to go with it.
> >
> > Why? is_spectre_bhb_fw_affected() returns true if (cpu in list OR fw
> > mitigated)
> 
> That affects reporting, but the mitigation works by making an
> ARM_SMCCC_ARCH_WORKAROUND_3 Secure Monitor Call to firmware, and that
> only works if that call is implemented in firmware. Trusted-Firmware-A
> is currently the only open source firmware I'm aware of that
> implements this call, and it only supports Kryo 4 and 6 upstream (not
> 2 or 3).
> 
> So in order for this patch to actually be able to do anything other
> than report that the mitigation is missing, it would need to run on
> devices that either use a downstream fork of TF-A with added Kryo 2/3
> support (I doubt this exists because AFAIK Kryo 4 was Qualcomm's first
> attempt to use TF-A) or use some other proprietary kind of Secure
> Monitor firmware that has this SMC and mitigation implemented
> separately. (It seems unlikely that Qualcomm did this in their QTEE
> firmware, since if they had they would have probably also added the
> MIDRs here to Linux to activate it.)

Ack, thanks for the detailed explanation.

-- 
With best wishes
Dmitry

