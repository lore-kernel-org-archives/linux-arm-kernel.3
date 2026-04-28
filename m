Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791D2FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 13:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/YnMDibrKzfhntLr7stNZ51Gy9Qv32dxEsIF+FY5/ng=; b=tflL17oBgJHudvux+Jv9Cqg1bt
	XGF9ZNH4wVZ5oZ305JU/aESc5a7HllXAUHnjfvmWA52un7Wsv0sXAvcdUxrdVdUN9MqPcZcj6qZ19
	eCAz84TaUUKUkiAyycvzSEQ0Yju9llB5+nBDkpsSe0XSbD2JUYIhEipZsIsX1JLlfuNg6ym0m9JhW
	z/geC4MDviZ8h2lZDPY8U5J6A0GMCSr2FUGj5O83zqbDEOkiYluCQz3TVWkA1z2DSFuIpiHxOMZ2O
	u88Y2jO9qzT1JMgE1eQbH7H1Bb4hNIwJUColAP9xR+Fk9mhDE25k06E6Q+sCzMX0mwgrC725+2uN+
	3FZaHmog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHi64-00000001UCs-1KhB;
	Tue, 28 Apr 2026 13:03:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHi5y-00000001UCT-22lT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 13:03:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9rGFS2112409
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:03:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YnMDibrKzfhntLr7stNZ51Gy9Qv32dxEsIF+FY5/ng=; b=gH7BX+o043XO51CZ
	eww7aZ4/jYejBslFXpdGy3jbqDCLi6bvJh23fkCh9dlEXnkG0cfqEdSX5VGs120d
	4Q8r8LvgVmwF7AYT1PyEmXMM3SHUPiAC2sxv8VM9Y3RAPmN6PNZdUDFj5euQ7wRu
	KbwpW46muq7TjRYRsb6Jd4fsTYjlieh1TM9aQY1S767SMquLuzQn/RbDm1F2yq43
	tROOpXtsuq73A1zLvD8fECk4A04GrzuuIa89D0qwyphjnU9V/Jw/wIaloeSVbPA6
	kXPtXN+ekEBEF5Do3gfP+Gpjj06Tw9VYTRoKOAIy9qATyLBqTFdFEqL0MHy+svQ+
	WxaxNw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbkm8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:03:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-834e0452d98so659665b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381401; x=1777986201; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YnMDibrKzfhntLr7stNZ51Gy9Qv32dxEsIF+FY5/ng=;
        b=FgTCotsomnPATv2RFXWH16c6w6e9vPzpQZBgXI46xshJ4P0y0taQoTr5dmJKZIehGg
         BAcV4MUGKd2MWbC+LKG3x9MTld0L3BiFpIcy6wrs1Dca37+iMczW10nPb+N/Qio4/KLE
         vC3LPWqTheNlVvaNQdU1lO6vhpE+K6cDlvrb9ufCFLThzagt9JL3ZK8rsQu+vKntOu7u
         vqH/IETEwScX0NHG9QZ6vqCYZEcl3linnok7SZ3xg0DjPStanxtVXxomOLZZUNpaSkuQ
         lAkxQuGOyfb1xEREo7bqFdnxPRRfwoM4jA5peWvRzQ+9zDbmc5dD9ZCpQr6zwnBC79vQ
         eD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381401; x=1777986201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YnMDibrKzfhntLr7stNZ51Gy9Qv32dxEsIF+FY5/ng=;
        b=CKGFz0v19tCMb1HHqKicCKEFatpxAyCy1HINlXDHp21f2AsOXQPiGcsEJKbS+o05qS
         MvRn8eJfOr2iE+x9pkjT6l5JDqMBqwJNOFuVUs8AKAwrZp9ExYoflwuYqA8mJqylCc/V
         lUikyB6cGT7bybclofuPdjdcPXgxTWZOjY1gblUODNyyf9RYm3PM84OEmKpqzbON9AsJ
         vUnpfawJOz+dVvuqV5UFpOiyaZV/9BLTU7U+kzj/o9C9xTSj6NH5FUA+hl5B+U8/In+v
         zYQtuyTWZYD8Q6eeTwdXxeocfx+P01vhSZhb69ZID+nld7pKhvdROOSNPwD8Thn2fV+8
         7WDg==
X-Forwarded-Encrypted: i=1; AFNElJ+rSX844NLPQwwmV0X4uAayakl+IJirthB2UUJNnJDaGkp3VG9jWD2imX7SNj3JmDu105ofCBnOQai+FAJJ2zdg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2/vCXNiUuJlyGtrxFapBSbeOlMctjh03/xFGJ0lDqVAuR+OBn
	S1ANsm8OqOJKjdQOLKpQqTAEWMefdwmyasvsRlyfcyhVfmM8gdian7q1pI5GNEzn68GYRSci5/+
	DJkF/uraOH/E40R7o9QCAW/xC/g+EbO0VGpVq7w4HghM6YOEn0NTrWloW8TRX6Dd0pDJSFxsfpG
	gKEQ==
X-Gm-Gg: AeBDiesacq9rASB/N9oTjOgZzP1pHAkI/sNX9A2YXdzM8iaWMM0isOzpp89gnoYM1gB
	m3sH0mzmfg2f0QVn53uajfHND7Rb43WgbeOKALHpNb9ZGEC9/WtH9aKaOEyA53Z/0L+qGjJ8sJH
	Tbr0EMj/+82/OI4uwSW6uGR44ggkimBpbQa9RZuEEyS2T8coJaqDR4Ab9qnSeM/uSCeHcze6JYy
	4zylX/ddYw9NxiUd3nwtqeeHG2p3URgJQkmovrvP/DffsYyEdK1Q8fFBXvpjFJy889u355T0c44
	EOzdyk9SQ6AVlUUVlPBWFKj8s5JQReJwRg9sa4kIOm2/P/Ft/ON7XDY0Gmafertct5UiR3gBdj6
	tR8EVw5+5tj2+euj8zlaeRjysg3M7+/NWl6zGhOlC5hqqPe2v7ixtEtNtMKItAgzi2xg=
X-Received: by 2002:a05:6a00:3691:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-834ddb28060mr3248332b3a.14.1777381400789;
        Tue, 28 Apr 2026 06:03:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:3691:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-834ddb28060mr3248246b3a.14.1777381400102;
        Tue, 28 Apr 2026 06:03:20 -0700 (PDT)
Received: from [10.218.41.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf7eaaasm2531210b3a.57.2026.04.28.06.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 06:03:19 -0700 (PDT)
Message-ID: <d6112b9c-01ea-483c-98fe-b480e78872e5@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 18:33:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
 <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
 <c0677503-8073-4940-8eb0-c06b34f843d2@oss.qualcomm.com>
 <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdxpSXiqAn-8Az4ig4N8TFVdE9psacPVG9J9KehuFnbwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: m3SIWYEMThG-FtSOxe05h4G-wVp_7k9s
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0b019 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=PlKOg72wQhDXdNgDaE8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: m3SIWYEMThG-FtSOxe05h4G-wVp_7k9s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMSBTYWx0ZWRfX5n5XjHqV79t2
 lXFWy1DhpXDgtWgBF7miT4uPRygxXU/8NxLPIxvLIg9XN+5OXBQbnoEYcqJiI7bbqLoX6BliVCx
 G7A2e7hLRaxY7gr/HSYuN8Aw8x2OwZcbZcJ5xbEBq6nNnEeqpftGkXQZbkRvzucSAzx0sFED/93
 SKJfADD8aTFGgQH/EMme4n6XWyjcqTpJazPso9bKQhDQQyaiq56krgTDWedUNj2GOFZXFh02rkT
 E6wb3NEoJtc2wd7T+Gva7LmouTlzLJ4lOxpdigp3F8AVT9FAmLCtxXkNawsdCNlfM3dj4ppZrRy
 Ca7HbKYXRHyelO4RANwU7hhyLObXmqQ0CpBllnRgnpXEBQHvLNt8Pui7jNn2/NZfeKTSl4E/Pmx
 0n+Q7HCbaxSTRhEO2bZvSLn5bUlOOxhN2r2rooZxDe8SG161XzTobAFKwYgGazqFnvz/e57vqpG
 +4X91ZC03V/eBhUX2sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_060322_531901_61FE7E9C 
X-CRM114-Status: GOOD (  21.67  )
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



On 28-04-2026 18:21, Bartosz Golaszewski wrote:
> On Tue, Apr 28, 2026 at 2:18 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 28-04-2026 13:33, Bartosz Golaszewski wrote:
>>> On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
>>> <shivendra.pratap@oss.qualcomm.com> said:
>>>> MFD core has no way to register a child device using an explicit firmware
>>>> node. This prevents drivers from registering child nodes when those nodes
>>>> do not define a compatible string. One such example is the PSCI
>>>> "reboot-mode" node, which omits a compatible string as it describes
>>>> boot-states provided by the underlying firmware.
>>>>
>>>> Extend struct mfd_cell with an optional fwnode pointer and attach it to the
>>>> child device during registration when no firmware node is already assigned.
>>>>
>>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>>> ---
>>>
>>> In the following patch you use this and violate the supposed constness of
>>> MFD cells. This also mean you need to modify the mfd_cell at run-time. I would
>>> prefer introducing a field in mfd_cell: bool use_parent_fwnode which would
>>> indicate to MFD core that - in case no fwnode was assigned from other sources:
>>> DT or software node - it should reuse the parent MFD device's node.
>>
>> Have one doubt on this, When we fallback to use_parent_fwnode for cell:
>> psci-reboot-mode, at psci_reboot_mode_probe(), pDev->dev->of_node point
>> to psci node.
>>
>> But we want dev->of_node to point to "reboot-mode" node. This may need
>> an explicit assignment again of of_node?
>>
> 
> Ah, sorry you're right. I'd like to avoid having to modify the
> mfd_cell entry at run-time if possible.
> 
> How about a callback in mfd_cell like:
> 
> struct fwnode_handle *(*get_fwnode)(struct device *parent);
> 
> If set, it would be called from MFD core and would do the name lookup
> and return the fwnode which would then be assigned to the cell device?

sure. thanks. We can make it a callback from MFD core.

thanks,
Shivendra

