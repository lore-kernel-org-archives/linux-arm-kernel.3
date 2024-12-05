Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4913BE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5mhDTiQCniX4dOvULwv2bY5E40qxNFbSX0TtTudBO0=; b=RSBU2Aam2rwpIJe+kbrUQT+1/q
	EwYBvkTTFik3w66Jc18592F+7GRc0QUmhC08L/Q9UBHeEIyVhjgyqFVZdO8ekDuFOqbpvlz+KXwX1
	7f47ZTtyFF+l7BLUtGPuQu9ee6yUorscXXfjxH+wVQRm1O4MFuAER/S8caFx0u3o8JmwKnMAUzt8y
	/+ZExytNdVMHEeoR3VGZqsxPhNVdMLEJgGovzZkHrh7uFZOmdWRvTeikyA1c2jYa/CC5d+jI28rRv
	Sish/zjClR+AdBqd93ehNnOZm+w/Pek48/8sUI0FBytByQ+GHFiRfsmnFnCsOoJjmEr5Da94MWbgN
	PkX5tftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFh4-0000000GxZR-2RzX;
	Thu, 05 Dec 2024 17:31:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFc8-0000000GwWO-3ks9;
	Thu, 05 Dec 2024 17:26:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so7781145e9.0;
        Thu, 05 Dec 2024 09:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733419567; x=1734024367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O5mhDTiQCniX4dOvULwv2bY5E40qxNFbSX0TtTudBO0=;
        b=ixmEheYyZ7IlAuHQ+H41w9DbVSrG/RGzk1YOrsjitAPv75xgoJJ6so1KcbyqsMBqCf
         OIXKYa7VxBE+Fo6ARKC2eNEfClh50jN1iguDN2wsXNrAT3E1U37l1gksZeUs2FSRYs37
         EhTOnG799tWQ+19VLR7g8wbpPOgLYB23t2IjqZqrHaEKg05mf4HIMQfqRPWpHMRovWeO
         F+V0XzwB+MASCfXpaR5V9H4oSn+oN9BnBG6Gmf1wElz62u7+kxV1egc7LriBKSGlqhWT
         Kx5W6tWay6l5tyzEK4lPB56tbTBMwS44TWOrWu0ur64uluq1t+kuNONPaxJNxVPphwD6
         je5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419567; x=1734024367;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5mhDTiQCniX4dOvULwv2bY5E40qxNFbSX0TtTudBO0=;
        b=ks1UZMAPOuEhRZYgHGqW9SUb1FIq9Hu3jIf3x5W6/RC/lIk6qaJqHVUsWx4kZwViLP
         6drGe2XBJT0LMMlN9xRpHG/dB8N3W5OV9z92AYcsrZhHVhz2tCa/S3zUBwqfvHCGrYe3
         Xdcjsrcz29eaZ6oYhEBhAHRl5J6DltKqPAVBjKp9oJCaifg3Az6yZVmBZfvPimOgIsfA
         RFOZU3Xassris30llP4bcOJlp2WxFSWxq2DjO/XjGKbCHA9yGOJ0qdzIpEEOB6XYzCZY
         zI+ZhqmTofvGokB1SQQAy3qC/36ok5aR4qs4hTb41dFgeNLy7dzfsJM6/xGEbY1BErVK
         RBnA==
X-Forwarded-Encrypted: i=1; AJvYcCWmUCMuM7tfBZFizgKh00JNPEhtgqjQSY5HgKFZUJfV6wgJM736LBEiGVtLHsBhP39DEKdEz23puzVQ+Woz5Y+J@lists.infradead.org, AJvYcCXTufCIITehTlpnhzIR1zF1d4iRPMzg5lDy5MrOUSbTJbNwNbbGycD4ad2YukE5wChMnd/P+JT58owbWC5doB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmIAh3QDBYvdZN9/lKnWLjnYxsPdLS+W7knlK9gzVq0wwkXXV8
	/NrT3CpRnicxf4q/IVQp6mJpUe7FpCXFJH2WWm05m82MitnXelHH
X-Gm-Gg: ASbGncugTHX61/pjReazwcRdGBjhrs1G/eqjvFjOjUPuC4u7wguzKni9UIQ1hBuhEu/
	Bkv0aYknAohdAim5X+hEB8hn/3KPtcHq9ulafOx0yPJWMnhJztLJpbA/DfhpRVUJlj0ctdCk/w3
	q6N61X2rwmAd05ngCNJHQoBHIH3U3qgflZlB7WkfywsoUvbs1nES9UFdDr9ycwfYFOStMaP0n9n
	AmHynchpktpgiorEr9Stg+HJ7rxv1ImRYJcY0EF93cdeCI+6JLFBLJaNlZJ8ffxtWMzaPvPfc39
	0Z51XQ==
X-Google-Smtp-Source: AGHT+IGWBr7m/eK/LTokHoFmkVp6cSV6bU7ybbZzYTsPTC5V+3f3UIT5XgVkJ22lghZ4+yW3kvJwBg==
X-Received: by 2002:a05:600c:1906:b0:431:7ccd:ff8a with SMTP id 5b1f17b1804b1-434ddee0503mr1062795e9.14.1733419566414;
        Thu, 05 Dec 2024 09:26:06 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b577sm68800725e9.3.2024.12.05.09.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:26:05 -0800 (PST)
Message-ID: <6751e22d.050a0220.3435c6.57de@mx.google.com>
X-Google-Original-Message-ID: <Z1HiKXfpdluKA0_w@Ansuel-XPS.>
Date: Thu, 5 Dec 2024 18:26:01 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205170629.ww7qcvgbqdf5ipcj@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205170629.ww7qcvgbqdf5ipcj@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_092608_952265_16DB1320 
X-CRM114-Status: GOOD (  17.18  )
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

On Thu, Dec 05, 2024 at 07:06:29PM +0200, Vladimir Oltean wrote:
> On Thu, Dec 05, 2024 at 03:51:33PM +0100, Christian Marangi wrote:
> > +	.port_fdb_add = an8855_port_fdb_add,
> > +	.port_fdb_del = an8855_port_fdb_del,
> > +	.port_fdb_dump = an8855_port_fdb_dump,
> > +	.port_mdb_add = an8855_port_mdb_add,
> > +	.port_mdb_del = an8855_port_mdb_del,
> 
> Please handle the "struct dsa_db" argument of these functions, so that
> you can turn on ds->fdb_isolation. It is likely that instead of a single
> AN8855_FID_BRIDGED, there needs to be a unique FID allocated for each
> VLAN-unaware bridge in order for their FDBs to be isolated from each
> other, and so that the same MAC address could live under both bridges.

Mh ok, I hoped we could first have the base DSA driver merged before
starting to applying these kind of feature.

Concept looks handy, ideally I can just assign one ID for each port
like:
port 1 -> FIB 1
port 2 -> FIB 1
port 3 -> FIB 2

Question:
Ports of the same bridge should have the same FIB?

What I need to check is how the switch handle this for learning. Does
the switch correctly create FDB entry with the right FIB? If that's not
the case then I think assisted_learning is needed and HW Learn can't be
used?

(I still need to check if I can assign a default FIB for a port...
Currently the STP register are 2 bit for each FIB id, so 16 different
FIB are possible)

Also do we have a script for selft tests? I remember there was one back
in the days for fdb isolation?

-- 
	Ansuel

