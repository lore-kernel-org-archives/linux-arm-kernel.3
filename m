Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18416F53D9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 21:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dlr7wB0rv8sQmrjoTlrAaBOXqL+Mq+yKnYa3vnC9aoY=; b=nczMX54pg3HAVrb88g1OZVY3F5
	0iHKaPqaB0YfR+x1/oPKGbFLb/p/7o/E6JW+dXBqyIn26dbiDFD1I7xn5F69IMQcq/5HFw4iSjUxg
	zB6UaRcvct5TCf1lIRMI/lSuueuv1QBhB5eUptF35w4Hi13grX9HUwHwDsHH0e3AQtPj0bbSo476E
	ayxzVfFQMm8cq3+gHeooRrFwak5yluygya4ZEbStUtpZwXTVNs8o4TUv+PArur8r0J/QoOCGcvrrz
	w71R9NnHbg+cz8hlA7Fp12O2Sqs5p+DGDHSSmmZ9Ww7wSyOGK6cwm+C3zH8IbRGu1TP8R6UpqkbKY
	dNo4TbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FBk-00000004rse-2s3z;
	Mon, 16 Mar 2026 21:09:24 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2FBh-00000004rsF-1H0M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 21:09:22 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b97cf8a73d8so115148966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 14:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773695358; cv=none;
        d=google.com; s=arc-20240605;
        b=eeg3UxTXwaq2EOLcAPQWCpmSkL+nQkAROapI/0kNxBISjSEX94Tk/njVzxOv/O/bWG
         yt2I8P7+qGjLHYfqw51ykLptBhYJSO+ulgAb//mZfSLDxOiwoCXJA4J1uDj0XuxYPM0a
         AjPRUXalts57bkkO6gKe2rOL2H9ACg+dloiVlCQ5cbwwaQ6nz0ajRZpGITp4Eh8YazQq
         bjLTjC53jkztwjZloV4aJwqRyLIJmJQ85qhXP6w78N1wGCgK6O9b+y64uUOadGW1NeyM
         gBu2RMbidxYSZmUvzARzUZsW2OOTOnoNkwbhpeSBt2PV6BkQ2pjefbtortvWX/VkatBy
         up2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dlr7wB0rv8sQmrjoTlrAaBOXqL+Mq+yKnYa3vnC9aoY=;
        fh=mk6yyValXDGTIbbnhmncBvh7fiGpdJq6sZJeGVDhgCA=;
        b=bNNahRX6aBH9nyXygkETrXAQOWHLB8//6RL1bp6sap6Todz1davMnb0y9MGR5ThlOL
         BWryFQ1G+3Ku+AfBYlH38UqmC5eEKNAthX2RJfD6l45M9Di8VIadGaMM3XUTJIbB81Ex
         JDM5FJjoUqx7zmCEDRjhvvvYS2s7mD+sF8OMDPQjDUUrYpA0G070aWVp+NePGIBfOvdl
         Gif+BLTsOQG/ozThA3ouFIOFCI2TeGyiA8JZ72v1vg4HK4euJ4qUfCToBCwfyV8BpfEP
         jIem9/GCCkoutw9t5ztQPHTME+vYJBkoZN0kdKwZPxect9UCK4wBuLReffN0JXqkU1mq
         epAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773695358; x=1774300158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlr7wB0rv8sQmrjoTlrAaBOXqL+Mq+yKnYa3vnC9aoY=;
        b=IiQKgCPlL9rj0yFIV6sZLheaPn3EnUbA2LkRtiBFc5PGnCbetLO3ZghGoe9reW5DZ3
         yDX4IyxKU14cTsSQTI3II1CivNxa4wF9oafzt3LAvyuZxCcQZziZNzeTAMFP+SdGI15O
         6cDvfxryCKbEAaUhVH/K6vPblLMA9PhX3JqoJ5kFiSIe8pDQFj0hVk+NGFfmcogn3emI
         7p2418f9kqQXuEHyjh1EoFiXJHw+XEVUitDfFUSPJ/CEECJ3OUKMwpgzK7lA/ARbCAJT
         xQHqFPR4q4r7uhSLCrjSX5AWu16UNpGEfKtqhO4LM7/QaPFt25FM4WPWddSw85to+ubu
         IThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773695358; x=1774300158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dlr7wB0rv8sQmrjoTlrAaBOXqL+Mq+yKnYa3vnC9aoY=;
        b=YAGSDaB25vHmNXL3SSRywn57ePwP8qYfOqRZJRmrw0Ba3+7n3cwIEf5zbfUWhmKWCE
         d1LHeH2JYrdm5Uzq+FbHMfv0JifAlKucvFEFOdXK2GJw3yND1RPu+HDNppqzMBxyF9a+
         hGCO4cdH2EXBdW6Jy5IjpXl80iXcf6oXlZg6lkPqTTn6iGTrHQRP8MjqIAzdotn2uSee
         piiBEeqtTz5quD+kTr5vfyAMCL8cEEQeqAGqF5a7hZ1jdhhU/Pwgwd+QHQvVyxQLJZtg
         A0KSKsMUZ2lhF4SyPeOz8yQ3u+VK2aJcCUlWpp/gut2cLu5tW3+9JELQVxr3YcJi+m0h
         +7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2RN1glzVIs0W3REdNIuy3qv9VXesS2Sp9xeJIFxWu+3nlTLo5bifX2IFEdwUIiSlCiLx2nK+cBojjAGpmoI9t@lists.infradead.org
X-Gm-Message-State: AOJu0YxR5HhGm9uFw1f07hFd/NyshYsRgJ7CGhl5kQBVfz57XeL7PilY
	XKONEkTunAfvZt+xgQJP7Ev4haopDDebfP1vW46Yrem10Zy+tLMdrFFqOUrVADwi6QA97kk8QG/
	qOLaNcs3+xlwDeAADHmwhSpBjNoJuMss=
X-Gm-Gg: ATEYQzy+EAznjq+zb7fGunXXCptEGFQ/hDT/q28yrRCWnSQXih/q738YnOUj1cyOJlH
	GOveQg/BKOWJBVjD1OjuyCZa5whwwzBd/HhUTMTIDqAjDJXM/7OnlmgldU6H6lodIjMsS6egKbB
	csFfokCav9DS8wv1Lgu+XYGCe/koAcDlS3kmHp7wPByIdI6IFbWOWCjYXnMJ38p+d3eCsjtIzRk
	0IkaniMgXYOUmdExD9hYJhxSpXNhhsRCpahsFqRSDTI30AepS8JAYZ8O7kU+g5lbRp1ddEWw3mA
	+lzNm1BY8PZwTin4T8OluIcTqmMdSwPHJBW0IBrLeqvCUAWljnuc0Y0FKYTFik8hrw1JOP90kSW
	FFfPH6GYGVFhn5OWU
X-Received: by 2002:a17:907:1b21:b0:b8f:a5c8:f75 with SMTP id
 a640c23a62f3a-b97653bbab0mr857878066b.52.1773695358108; Mon, 16 Mar 2026
 14:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260225230827.21715-1-rosenp@gmail.com> <20260225230827.21715-5-rosenp@gmail.com>
 <20260316204422.2145317-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260316204422.2145317-1-florian.fainelli@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 16 Mar 2026 14:09:07 -0700
X-Gm-Features: AaiRm52aXQEgdzrzMqb2fhW4mPjLDkWE8Ucj_OrzRd5eKxaoFWM7VAAel9ZUUQI
Message-ID: <CAKxU2N8bNdUC9eS_qgqsJ3o=scmGnYoWh32AMQCpL2DDmdt52w@mail.gmail.com>
Subject: Re: [PATCHv2 4/4] ARM: dts: BCM5301X: AC5300: set WAN MAC from nvram
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_140921_371742_5C45B0A2 
X-CRM114-Status: GOOD (  10.03  )
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

On Mon, Mar 16, 2026 at 1:44=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> From: Florian Fainelli <f.fainelli@gmail.com>
>
> On Wed, 25 Feb 2026 15:08:27 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> > The WAN MAC is offset by 1. Set in dts to avoid having to handle this i=
n
> > userspace.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
>
> Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, =
thanks!
There was a copy/paste error here. et0macaddr should be et1macaddr.
Should I resend?
> --
> Florian

